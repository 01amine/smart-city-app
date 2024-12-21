import 'package:bsc/features/map/domain/entities/location.dart';
import 'package:bsc/features/map/domain/entities/route.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class LocationLoaded extends MapState {
  final LocationEntity location;

  LocationLoaded(this.location);
}

class LocationsFound extends MapState {
  final List<LocationEntity> locations;

  LocationsFound(this.locations);
}

class RouteLoaded extends MapState {
  final RouteEntity route;

  RouteLoaded(this.route);
}

class MapError extends MapState {
  final String error;

  MapError(this.error);
}