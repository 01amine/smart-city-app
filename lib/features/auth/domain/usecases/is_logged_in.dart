

import 'package:bsc/features/auth/domain/repository/auth.dart';
import 'package:bsc/features/auth/domain/usecases/usecase.dart';
import 'package:bsc/shared/utils/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {

  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
  
}