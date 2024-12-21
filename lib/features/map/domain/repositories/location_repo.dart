import 'package:bsc/features/map/domain/entities/location.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
  Future<List<LocationEntity>> searchLocations(String query);
}
