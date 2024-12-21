import 'package:bsc/features/home/data/models/hotel_model.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';

abstract class HotelRemoteDataSource {
  Future<List<HotelModel>> fetchRecommendedHotels();
  Future<List<HotelModel>> fetchTrendingDestinations();
  Future<List<HotelModel>> fetchSpecialOffers();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {


  HotelRemoteDataSourceImpl();

  @override
  Future<List<HotelModel>> fetchRecommendedHotels() async {
    final response = await sl<DioClient>().get('api/recommended');
    return (response as List)
        .map((json) => HotelModel.fromJson(json))
        .toList();
  }
  
  @override
  Future<List<HotelModel>> fetchSpecialOffers() async{
    final response = await sl<DioClient>().get('api/specialOffers');
    return (response as List)
        .map((json) => HotelModel.fromJson(json))
        .toList();
  }
  
  @override
  Future<List<HotelModel>> fetchTrendingDestinations() async{
    final response = await sl<DioClient>().get('api/destinations');
    return (response as List)
        .map((json) => HotelModel.fromJson(json))
        .toList();
  }

  
}
