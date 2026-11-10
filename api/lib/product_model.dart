class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;
  int? stock;
  double? rating;
  String? brand;

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    image = json["image"];
    stock = json["stock"];
    rating = json["rating"];
    brand = json["brand"];
  }
}


/*
"id": 1,
"name": "iPhone 15 Pro",
"description": "Latest iPhone with advanced features",
"price": 999.99,
"image": "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400&h=400&fit=crop",
"stock": 50,
"rating": 4.8,
"brand": "Apple",
*/