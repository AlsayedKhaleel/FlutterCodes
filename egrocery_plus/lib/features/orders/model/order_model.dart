class OrderModel {
  int? orderNumber;
  String? status;
  DateTime? date2Deliver;
  double? price;

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orderNumber = json['data'][0]['id'];
      price = json['data'][0]['total'];
      status = json['data'][0]['status'];
      date2Deliver = DateTime.utc(json['data'][0]['deliveredAt']);
    }
  }
}

/*
{
    "status_code": 200,
    "data": [
        {
            "id": 1,
            "userId": 1,
            "items": [
                {
                    "productId": 2,
                    "quantity": 1,
                    "price": 899.99,
                    "product": {
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
                    }
                },
                {
                    "productId": 5,
                    "quantity": 2,
                    "price": 79.99,
                    "product": {
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
                    }
                }
            ],
            "total": 1059.97,
            "status": "delivered",
            "shippingAddress": {
                "street": "123 Main St",
                "city": "New York",
                "state": "NY",
                "zipCode": "10001",
                "country": "USA"
            },
            "paymentMethod": "credit_card",
            "createdAt": "2024-01-18T14:22:00Z",
            "deliveredAt": "2024-01-22T16:45:00Z"
        }
    ],

    "message": "Order history retrieved successfully"
}

*/
