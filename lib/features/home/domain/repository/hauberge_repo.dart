import 'package:bsc/features/home/data/models/hauberge.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getRecommendedHotels();
  Future<List<Hotel>> getTrendingDestinations();
  Future<List<Hotel>> getSpecialOffers();
}
