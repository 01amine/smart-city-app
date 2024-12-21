import 'package:bsc/features/auth/domain/repository/auth.dart';
import 'package:bsc/features/auth/domain/usecases/usecase.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<AuthRepository>().logout();
  }
}
