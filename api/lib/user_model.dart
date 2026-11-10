class UserModel {
  int? usrID;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  String? city;
  String? suite;

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    usrID = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    website = json["website"];
    city = json["address"]["city"];
    suite = json["address"]["suite"];
  }
}

/*
"id": 4,
        "name": "Patricia Lebsack",
        "username": "Karianne",
        "email": "Julianne.OConner@kory.org",
        "phone": "493-170-9623 x156",
        "website": "kale.biz",

        "address": {
            "street": "Hoeger Mall",
            "suite": "Apt. 692",
            "city": "South Elvis",
            "zipcode": "53919-4257",
          }


*/