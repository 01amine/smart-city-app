import 'package:bsc/features/map/domain/entities/location.dart';

abstract class MapEvent {}

class LoadCurrentLocation extends MapEvent {}

class SearchLocations extends MapEvent {
  final String query;

  SearchLocations(this.query);
}

class GetRoute extends MapEvent {
  final LocationEntity start;
  final LocationEntity end;

  GetRoute(this.start, this.end);
}