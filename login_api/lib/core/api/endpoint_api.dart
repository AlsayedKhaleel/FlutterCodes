import 'package:dio/dio.dart';

class EndpointAPI {
  static final ENDPOINT = Dio(
    BaseOptions(
      baseUrl:
          "https://ecommerce-5rfssu72u-ahmed-allams-projects-14fb3aa3.vercel.app/",
    ),
  );

  // performs post method on API endpoint.
  static Future<Response<dynamic>> postMethod({
    required String target,
    body,
  }) async {
    return await ENDPOINT.post(target, data: body);
  }
}
