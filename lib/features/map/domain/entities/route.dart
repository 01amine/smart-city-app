import 'package:bsc/features/map/domain/entities/location.dart';

class RouteEntity {
  final List<LocationEntity> points;
  final double distance;
  final double duration;

  RouteEntity({
    required this.points,
    required this.distance,
    required this.duration,
  });
}
