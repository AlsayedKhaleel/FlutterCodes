///This class models the user's fetched data to display.
class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }
}
