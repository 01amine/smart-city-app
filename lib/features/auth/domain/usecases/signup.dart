import 'package:bsc/features/auth/data/models/signup_req_params.dart';
import 'package:bsc/features/auth/domain/repository/auth.dart';
import 'package:bsc/features/auth/domain/usecases/usecase.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements UseCase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams ? param}) async {
    return sl<AuthRepository>().signup(param!);
  }
  
}