import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class LogoutUser extends ProfileEvent {}

class ChangeProfileLanguage extends ProfileEvent {
  final String language;

  ChangeProfileLanguage(this.language);

  @override
  List<Object?> get props => [language];
}
