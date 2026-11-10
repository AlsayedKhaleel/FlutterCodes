class PostModel {
  int? id;
  String? title;
  String? body;

  PostModel.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}