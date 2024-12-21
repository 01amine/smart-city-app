import 'package:bsc/features/map/data/model/location.dart';
import 'package:bsc/features/map/domain/entities/location.dart';
import 'package:bsc/features/map/domain/entities/route.dart';

class RouteModel extends RouteEntity {
  RouteModel({
    required List<LocationEntity> points,
    required double distance,
    required double duration,
  }) : super(points: points, distance: distance, duration: duration);

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      points: (json['points'] as List)
          .map((point) => LocationModel.fromJson(point))
          .toList(),
      distance: json['distance'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points.map((point) => (point as LocationModel).toJson()).toList(),
      'distance': distance,
      'duration': duration,
    };
  }
}
