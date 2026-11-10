class NoteModel {
  String title = "";
  String content = "";
  int? colorIndx = 0;

  NoteModel.fromMap(Map<String, dynamic> map) {
    title = map["title"] ?? "";
    content = map["content"] ?? "";
    colorIndx = map["colorIndx"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {"title": title, "content": content, "colorIndx": colorIndx};
  }

  NoteModel({
    required this.title,
    required this.content,
    this.colorIndx,
  });
}
