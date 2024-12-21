import 'package:bsc/features/profile/domain/repos/profile_repo.dart';
import 'package:bsc/shared/utils/failure.dart';
import 'package:dartz/dartz.dart';

class ChangeLanguage {
  final ProfileRepository repository;

  ChangeLanguage(this.repository);

  Future<Either<Failure, void>> call(String language) {
    return repository.changeLanguage(language);
  }
}
