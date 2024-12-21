import 'package:bsc/features/map/domain/repositories/location_repo.dart';
import 'package:bsc/features/map/domain/repositories/route_repo.dart';
import 'package:bsc/features/map/presentation/bloc/map_event.dart';
import 'package:bsc/features/map/presentation/bloc/map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationRepository locationRepository;
  final RouteRepository routeRepository;

  MapBloc({
    required this.locationRepository,
    required this.routeRepository,
  }) : super(MapInitial()) {
    on<LoadCurrentLocation>((event, emit) async {
      try {
        final location = await locationRepository.getCurrentLocation();
        emit(LocationLoaded(location));
      } catch (e) {
        emit(MapError(e.toString()));
      }
    });

    on<SearchLocations>((event, emit) async {
      try {
        final locations = await locationRepository.searchLocations(event.query);
        emit(LocationsFound(locations));
      } catch (e) {
        emit(MapError(e.toString()));
      }
    });

    on<GetRoute>((event, emit) async {
      try {
        final route = await routeRepository.getRoute(event.start, event.end);
        emit(RouteLoaded(route));
      } catch (e) {
        emit(MapError(e.toString()));
      }
    });
  }
}
