

import 'package:bsc/features/profile/domain/entities/profile.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  ProfileLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileLoggedOut extends ProfileState {}

class LanguageChanged extends ProfileState {
  final String language;

  LanguageChanged({required this.language});

  @override
  List<Object?> get props => [language];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
