///APIs response model to maintain that returned data found in 'response.data'.
class RegisterResponseModel {
  int? statusCode;
  Data? data;
  String? message;

  /// This class should recieve 'response.data' at json argument.
  RegisterResponseModel.fromJson(Map<dynamic, dynamic> json) {
    statusCode = json["status_code"];
    data = json['data'] != null ? Data.fromJson(json["data"]) : null;
    message = json["message"];
  }
}

///The data returned back from the API is the user's data and his token.
class Data {
  String? token;
  User? user;

  Data.fromJson(Map<dynamic, dynamic> map) {
    token = map["token"];
    user = User.fromJson(map["user"]);
  }
}

///User's data returned back by the API call.
class User {
  int? id;
  String? name;
  String? email;
  String? phoneNo;
  String? image;

  User.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    phoneNo = map["phoneNo"];
    image = map["image"];
  }
}
