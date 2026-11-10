class ItemModel {
  String? title;
  String? description;
  double? price;
  double? discount;
  int? reviews;
  bool? isFavorite;
  List<String>? images;
  String? volume;
  String? category;

  ItemModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    reviews = json['reviews'];
    isFavorite = json['isFavorite'];
    volume = json['volume'];
    category = json['category'];
    images = json['images'];
  }
}
