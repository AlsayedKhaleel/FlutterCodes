class Chat {
  String chatName = "";
  String message = "";
  String imageURL = "";
  String arrivalTime = "";
  String? type;

  Chat.fromJSON(Map<dynamic, dynamic> json) {
    chatName = json["chatName"];
    message = json["message"];
    imageURL = json["imageURL"];
    arrivalTime = json["arrivalTime"];
    type = json["type"];
  }
}