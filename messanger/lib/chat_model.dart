class ChatModel {
  String? chatName;
  String? imageURL;
  bool? isOnline;
  String? lastSeenOnline;
  String? messageContent;
  String? arrivalTime;

  ChatModel.fromJson(Map<dynamic, dynamic> json) {
    chatName = json["chatName"];
    imageURL = json["imageURL"];
    isOnline = (json["isOnline"] == "true");
    lastSeenOnline = json["lastSeenOnline"];
    arrivalTime = json["arrivalTime"];
    messageContent = json["messageContent"];
  }
}