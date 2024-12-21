import 'package:bsc/features/auth/data/models/signin_req_params.dart';
import 'package:bsc/features/auth/domain/repository/auth.dart';
import 'package:bsc/features/auth/domain/usecases/usecase.dart';
import 'package:bsc/shared/utils/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams ? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}