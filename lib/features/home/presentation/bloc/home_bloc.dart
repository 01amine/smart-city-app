import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadDataEvent) {
      yield HomeLoading();
      try {
        // Here, replace with actual data fetching logic (e.g., API calls)
        final List<Map<String, String>> pourVousData = [
          {
            "image": "assets/parc2.jpg",
            "name": "Korso Hauberge",
            "location": "Boumerdas"
          },
          {"image": "assets/hotel.png", "name": "Hayatt", "location": "Boumerdas"},
        ];
        final List<Map<String, String>> destinationsTendanceData = [
          {"image": "assets/parc.jpg", "name": "Korso Parc", "location": "Boumerdas"},
          {
            "image": "assets/hauberge.jpg",
            "name": "Family Parc",
            "location": "Boumerdas"
          },
          {"image": "assets/aqua.png", "name": "Aqua Blue", "location": "Boumerdas"},
        ];
        final List<Map<String, String>> offresSpecialesData = [
          {"image": "assets/offre.png"},
          {"image": "assets/offre.png"},
          {"image": "assets/offre.png"},
        ];

        yield HomeLoaded(pourVousData, destinationsTendanceData, offresSpecialesData);
      } catch (e) {
        yield HomeError("Failed to load data");
      }
    }
  }
}
