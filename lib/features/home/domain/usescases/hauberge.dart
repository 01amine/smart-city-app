import 'package:bsc/features/home/data/models/hauberge.dart';
import 'package:bsc/features/home/domain/repository/hauberge_repo.dart';

class GetRecommendedHotels {
  final HotelRepository repository;

  GetRecommendedHotels(this.repository);

  Future<List<Hotel>> execute() async {
    return await repository.getRecommendedHotels();
  }
}
