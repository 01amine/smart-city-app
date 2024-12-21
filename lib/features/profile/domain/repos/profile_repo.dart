import 'package:bsc/features/profile/domain/entities/profile.dart';
import 'package:bsc/shared/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> changeLanguage(String language);
}
