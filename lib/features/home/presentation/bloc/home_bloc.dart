import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadDataEvent) {
      yield HomeLoading();
      try {
        final response = await sl<DioClient>().get('api/homedata');

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          final List<Map<String, String>> pourVousData =
              List<Map<String, String>>.from(data['pourVousData']);
          final List<Map<String, String>> destinationsTendanceData =
              List<Map<String, String>>.from(data['destinationsTendanceData']);
          final List<Map<String, String>> offresSpecialesData =
              List<Map<String, String>>.from(data['offresSpecialesData']);

          yield HomeLoaded(
              pourVousData, destinationsTendanceData, offresSpecialesData);
        } else {
          yield HomeError('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        yield HomeError('Failed to load data: $e');
      }
    }
  }
}
