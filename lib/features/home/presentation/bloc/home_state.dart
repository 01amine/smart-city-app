part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Map<String, String>> pourVousData;
  final List<Map<String, String>> destinationsTendanceData;
  final List<Map<String, String>> offresSpecialesData;

  const HomeLoaded(
    this.pourVousData,
    this.destinationsTendanceData,
    this.offresSpecialesData,
  );

  @override
  List<Object?> get props => [pourVousData, destinationsTendanceData, offresSpecialesData];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
