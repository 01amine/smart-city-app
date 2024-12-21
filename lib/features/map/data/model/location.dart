import 'package:bsc/features/map/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required double latitude,
    required double longitude,
    required String name,
  }) : super(latitude: latitude, longitude: longitude, name: name);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
    };
  }
}
