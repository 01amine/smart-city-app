import 'package:bsc/features/map/data/model/route.dart';

import '../model/location.dart';

class RemoteRouteDataSource {
  final String apiKey;

  RemoteRouteDataSource(this.apiKey);

  Future<RouteModel> getRoute(LocationModel start, LocationModel end) async {
    return RouteModel(
      points: [start, end],
      distance: 10.0,
      duration: 15.0,
    );
  }
}
