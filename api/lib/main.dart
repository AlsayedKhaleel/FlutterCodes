import 'package:api/post_model.dart';
import 'package:api/product_model.dart';
import 'package:api/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  var API_ENDPOINT = Dio();
  API_ENDPOINT.options.baseUrl =
      "https://ecommerce-5rfssu72u-ahmed-allams-projects-14fb3aa3.vercel.app/";

  final response = await API_ENDPOINT.get("products");
  final data = response.data["data"]["products"] as List<dynamic>;

  print("=====================${response}");
  print("=====================Data: ${data}");

  // var response = await API_ENDPOINT.post(
  //   "products",
  //   data: {
  //     "name": "iPad Pro 12.9",
  //     "description": "Latest iPad with M2 chip",
  //     "price": 1099.99,
  //     "categoryId": 1,
  //     "image":
  //         "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400",
  //     "stock": 20,
  //     "brand": "Apple",
  //   },
  // );
  // var data = response.data as Map;
  // print(
  //   "====================================================================================",
  // );
  // print(data["message"]);
  // print(response.statusCode);
  // print(
  //   "====================================================================================",
  // );

  if (response.statusCode == 200) {
    List<ProductModel> products = data
        .map((e) => ProductModel.fromJson(e))
        .toList();
    runApp(MyApp(products: products));

    // List<PostModel> posts = data.map((element) {
    //   return PostModel.fromJson(element);
    // }).toList();
    // runApp(MyApp(posts: posts));
    // List<UserModel> users = data.map((e) => UserModel.fromJson(e)).toList();
    // runApp(MyApp());
  } else {
    print("=====================Error Code: ${response.statusCode.toString()}");
  }
}

class MyApp extends StatelessWidget {
  // List<PostModel> posts;
  // List<UserModel> users;
  // bool isLoading = true;
  List<ProductModel> products;

  MyApp({super.key, required this.products});
  // MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "APIs TEST",
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (c, i) => Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "${products[i].name}",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${products[i].description}",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "\$${products[i].price}",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${products[i].stock}",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Center(child: Image.network("${products[i].image}")),
                    ],
                  ),

                  separatorBuilder: (c, i) =>
                      Divider(thickness: 10, color: Colors.amber),
                  itemCount: products.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
