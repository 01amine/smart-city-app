import 'package:bsc/features/profile/data/data_source/data_source.dart';
import 'package:bsc/features/profile/domain/entities/profile.dart';
import 'package:bsc/features/profile/domain/repos/profile_repo.dart';
import 'package:bsc/shared/utils/failure.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final profile = await dataSource.fetchProfile();
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> changeLanguage(String language) async {
    try {
      await dataSource.setLanguage(language);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
