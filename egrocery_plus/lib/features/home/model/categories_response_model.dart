///Represents the returned response of the API against 'categories' path.
class CategoriesResponseModel {
  int? statusCode;
  List<CategoryModel>? categories;
  String? message;

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];

    //TODO: don't foget null check.
    categories = List<Map<String, dynamic>>.from(
      json['data'],
    ).map((e) => CategoryModel.fromJson(e)).toList();

    // categories?.forEach(
    //   (e) => print("************************> ${e.description}"),
    // );
  }
}

///Category model.
class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? image;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
}
