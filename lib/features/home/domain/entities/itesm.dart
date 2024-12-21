abstract class ListItem {}

class HotelItem extends ListItem {
  final String imagePath;
  final String name;
  final String location;
  final double price;
  final double rating;

  HotelItem({
    required this.imagePath,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
  });
}

class SpecialOfferItem extends ListItem {
  final String imagePath;
  final String description;

  SpecialOfferItem({
    required this.imagePath,
    required this.description,
  });
}

class HeaderItem extends ListItem {
  final String title;

  HeaderItem({required this.title});
}
