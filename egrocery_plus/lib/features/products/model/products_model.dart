
class ProductsResponseModel {
  int? statusCode;
  String? message;
  List<ProductModel>? data;

  ProductsResponseModel.fomJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<Map<String, dynamic>>.from(
        json['data']['products'],
      ).map((e) => ProductModel.fomJson(e)).toList();
    }
  }
}


/*
{
    "status_code": 200,
    "data": {
        "products": [
            {
                "id": 1,
                "name": "iPhone 15 Pro",
                "description": "Latest iPhone with advanced features",
                "price": 999.99,
                "categoryId": 1,
                "image": "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400&h=400&fit=crop",
                "stock": 50,
                "rating": 4.8,
                "reviews": 1234,
                "brand": "Apple",
                "createdAt": "2024-01-15T10:00:00Z"
            },
            {
                "id": 2,
                "name": "Samsung Galaxy S24",
                "description": "Premium Android smartphone",
                "price": 899.99,
                "categoryId": 1,
                "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop",
                "stock": 30,
                "rating": 4.7,
                "reviews": 987,
                "brand": "Samsung",
                "createdAt": "2024-01-10T09:00:00Z"
            },
            {
                "id": 3,
                "name": "MacBook Air M3",
                "description": "Ultra-thin laptop with M3 chip",
                "price": 1299.99,
                "categoryId": 1,
                "image": "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400&h=400&fit=crop",
                "stock": 25,
                "rating": 4.9,
                "reviews": 756,
                "brand": "Apple",
                "createdAt": "2024-01-08T14:30:00Z"
            },
            {
                "id": 4,
                "name": "Nike Air Max 270",
                "description": "Comfortable running shoes",
                "price": 149.99,
                "categoryId": 2,
                "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop",
                "stock": 100,
                "rating": 4.5,
                "reviews": 432,
                "brand": "Nike",
                "createdAt": "2024-01-12T11:15:00Z"
            },
            {
                "id": 5,
                "name": "Levi's 501 Jeans",
                "description": "Classic straight-leg jeans",
                "price": 79.99,
                "categoryId": 2,
                "image": "https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop",
                "stock": 75,
                "rating": 4.3,
                "reviews": 298,
                "brand": "Levi's",
                "createdAt": "2024-01-05T16:20:00Z"
            },
            {
                "id": 6,
                "name": "Coffee Maker Deluxe",
                "description": "Automatic drip coffee maker",
                "price": 89.99,
                "categoryId": 3,
                "image": "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=400&fit=crop",
                "stock": 40,
                "rating": 4.4,
                "reviews": 167,
                "brand": "HomeBrews",
                "createdAt": "2024-01-03T08:45:00Z"
            },
            {
                "id": 7,
                "name": "The Great Gatsby",
                "description": "Classic American novel",
                "price": 12.99,
                "categoryId": 4,
                "image": "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=400&fit=crop",
                "stock": 200,
                "rating": 4.6,
                "reviews": 89,
                "brand": "Penguin Classics",
                "createdAt": "2024-01-01T12:00:00Z"
            }
        ],
        "pagination": {
            "page": 1,
            "limit": 10,
            "total": 7,
            "pages": 1
        }
    },
    "message": "Products retrieved successfully"
}
*/


///Class that maintains the data of the product.
class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  int? categoryId;
  String? image;
  int? stock;
  double? rating;
  int? reviews;
  String? brand;
  String? createdAt;

  ProductModel.fomJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    image = json['image'];
    stock = json['stock'];
    rating = json['rating'];
    reviews = json['reviews'];
    brand = json['brand'];
    createdAt = json['createdAt'];
  }
}
