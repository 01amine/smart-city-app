import 'package:bsc/features/profile/domain/usescases/change_language.dart';
import 'package:bsc/features/profile/domain/usescases/get_profile.dart';
import 'package:bsc/features/profile/domain/usescases/logout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final Logout logout;
  final ChangeLanguage changeLanguage;

  ProfileBloc({
    required this.getProfile,
    required this.logout,
    required this.changeLanguage,
  }) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      final result = await getProfile();
      emit(result.fold(
        (failure) => ProfileError(message: failure.message),
        (profile) => ProfileLoaded(profile: profile),
      ));
    });

    on<LogoutUser>((event, emit) async {
      emit(ProfileLoading());
      final result = await logout();
      emit(result.fold(
        (failure) => ProfileError(message: failure.message),
        (_) => ProfileLoggedOut(),
      ));
    });

    on<ChangeProfileLanguage>((event, emit) async {
      final result = await changeLanguage(event.language);
      emit(result.fold(
        (failure) => ProfileError(message: failure.message),
        (_) => LanguageChanged(language: event.language),
      ));
    });
  }
}

extension on Object? {
  get message => null;
}
