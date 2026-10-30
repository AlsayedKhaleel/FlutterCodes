import 'package:hive/hive.dart';

class QuizHive {
  // 
  static String quizBox = "quizBox";
  static String _boxKey = "key1";
  static List<int> _scoresList = [];

  // gameCount:gameScore
  static void loadRanks() async {
    _scoresList = await Hive.box(quizBox).get(_boxKey) ?? [];
  }

  // retrieve the number of played games.
  static int getGamesCount() {
    return _scoresList.length+1; // +1 because the issued score is ranked over all the games (including the issued one.)
  }

  // stores the 'score' in the list of scores.
  static void storeScore(int score) async {
    _scoresList.add(score);
    await Hive.box(quizBox).put(_boxKey, _scoresList);
  }

  // returns back the rank of 'score' corresponding to the preivous scores.
  static int getGameRank(int score) {
    // return the length of the list of number greater thatn 'score'.
    return _scoresList.where((s) => s > score).length + 1;
  }
}
