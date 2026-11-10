// import 'package:dio/dio.dart';

// ///This class is the app interface with the server.
// ///Will help me in APIs interactions.
// class ApiHelper {
//   // This is our API working opbject, initialized with the base URL.
//   static final Dio _API_REF = Dio()
//     ..options.baseUrl =
//         "https://ecommerce-5rfssu72u-ahmed-allams-projects-14fb3aa3.vercel.app/";

//   static final String _login = "login"; // user login target path.
//   static final String _register = "register"; // user registration target path.
//   static final String _categories =
//       "categories"; // products categories target path.
//   static final String _products = "products"; // products  target path.
//   static final String _orders = "orders/user/";

//   ///This method performs user authentication by passing to it the
//   ///user'e email and their password.
//   static Future<Response> userLogin({
//     required String email,
//     required String password,
//   }) async {
//     return await _API_REF.post(
//       _login,
//       data: {"email": email, "password": password},
//     );
//   }

//   ///This method performs new user registration on the app.
//   static Future<Response> userRegister({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     return await _API_REF.post(
//       _register,
//       data: {
//         "name": name,
//         "email": email,
//         "password": password,

//         /* Some static data just for learning purposes. */
//         "phone": "+1234567892",
//         "image":
//             "https://i.etsystatic.com/31548528/r/il/ffde13/5804742914/il_fullxfull.5804742914_ap2d.jpg",
//       },
//     );
//   }

//   ///Fetches the products categories from the server.
//   static Future<Response> getCategories() async {
//     return await _API_REF.get(_categories);
//   }

//   ///Fetches the products themselves from the server.
//   static Future<Response> getProducts() async {
//     return await _API_REF.get(_products);
//   }

//   static Future<Response> getOrders() async {
//     /*
//     final dio = Dio(
//   BaseOptions(
//     baseUrl: 'https://api.example.com',
//     headers: {
//       'Authorization': 'Bearer YOUR_TOKEN_HERE',
//     },
//   ),
// );
// */
//     // return await _API_REF.options.headers.get("${_orders}+${2}", headers
//   }
// }
