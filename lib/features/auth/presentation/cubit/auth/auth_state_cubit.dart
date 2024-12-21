import 'package:bsc/features/auth/domain/usecases/is_logged_in.dart';
import 'package:bsc/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStateCubit extends Cubit<AuthState> {

  AuthStateCubit() : super(AppInitialState());
  
  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

}