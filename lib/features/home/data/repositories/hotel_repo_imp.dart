import 'package:bsc/features/home/data/datasource/remote_datasource.dart';
import 'package:bsc/features/home/data/models/hauberge.dart';
import 'package:bsc/features/home/domain/repository/hauberge_repo.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource remoteDataSource;

  HotelRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Hotel>> getRecommendedHotels() async {
    return await remoteDataSource.fetchRecommendedHotels();
  }

  @override
  Future<List<Hotel>> getSpecialOffers() async {
    return await remoteDataSource.fetchSpecialOffers();
  }

  @override
  Future<List<Hotel>> getTrendingDestinations() async {
    return await remoteDataSource.fetchTrendingDestinations();
  }
}
