class ResponseModel {
  int? statusCode;
  String? message;
  Data? data;

  ResponseModel.fromJson(Map<dynamic, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null ;
  }
}

class Data {
  String? token;
  User? user;

  Data.fromJson(Map<dynamic, dynamic> json) {
    user = User.fromJson(json["user"]);
    token = json["token"];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  User.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
  }
}
