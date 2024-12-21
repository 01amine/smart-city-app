import 'package:bsc/features/home/data/models/hauberge.dart';

class HotelModel extends Hotel {
  HotelModel({
    required String id,
    required String name,
    required String location,
    required String imagePath,
    required double price,
    required double rating,
  }) : super(
          name: name,
          location: location,
          imagePath: imagePath,
          price: price,
          rating: rating,
        );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imagePath: json['imagePath'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
