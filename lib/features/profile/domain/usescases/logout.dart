import 'package:bsc/features/profile/domain/repos/profile_repo.dart';
import 'package:bsc/shared/utils/failure.dart';
import 'package:dartz/dartz.dart';

class Logout {
  final ProfileRepository repository;

  Logout(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.logout();
  }
}
