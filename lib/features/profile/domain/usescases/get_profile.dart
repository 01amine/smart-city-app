import 'package:bsc/features/profile/domain/repos/profile_repo.dart';
import 'package:bsc/shared/utils/failure.dart';

import '../entities/profile.dart';
import 'package:dartz/dartz.dart';

class GetProfile {
  final ProfileRepository repository;

  GetProfile(this.repository);

  Future<Either<Failure, Profile>> call() {
    return repository.getProfile();
  }
}
