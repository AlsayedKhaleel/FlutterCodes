///To maintain the questions loaded from that list of maps in 'questions.dart' file.
class QeustionModel {
  String question = "";
  List<String> options = [];
  String answer = "";

  QeustionModel.fromJson(Map<dynamic, dynamic> json) {
    question = json['question'];
    options = json['options'];
    answer = json['answer'];
  }
}
