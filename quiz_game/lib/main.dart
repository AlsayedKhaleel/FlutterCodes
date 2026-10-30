import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_game/core/helpers/hive_helper.dart';
import 'package:quiz_game/features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox(QuizHive.quizBox); // open the quiz box.
  QuizHive.loadRanks(); // load ranks from hive to the list.

  runApp(Quizzer());
}

// Application wrapper (driver).
class Quizzer extends StatelessWidget {
  const Quizzer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
    // return GetMaterialApp(home: MyWidget(),);
  }
}
