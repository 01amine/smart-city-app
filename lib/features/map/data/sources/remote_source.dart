import 'package:bsc/features/map/data/model/location.dart';

class RemoteLocationDataSource {
  final String apiKey;

  RemoteLocationDataSource(this.apiKey);

  Future<LocationModel> getCurrentLocation() async {
    return LocationModel(latitude: 36.75, longitude: 3.05, name: "Boumerdas");
  }

  Future<List<LocationModel>> searchLocations(String query) async {
    return [
      LocationModel(latitude: 36.75, longitude: 3.05, name: "Boumerdas"),
    ];
  }
}
