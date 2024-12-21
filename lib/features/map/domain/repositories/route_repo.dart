import 'package:bsc/features/map/domain/entities/location.dart';
import 'package:bsc/features/map/domain/entities/route.dart';

abstract class RouteRepository {
  Future<RouteEntity> getRoute(LocationEntity start, LocationEntity end);
}
