import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_firebase/core/helpers/hive_helper.dart';
import 'package:test_firebase/features/splash/view/splash_screen.dart';
import 'package:test_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox(HiveHelper.skipOnboardingBox);

  runApp(const EduPro());

  // print("==================================");
  // print(HiveHelper.skipOnboarding());
  // print("==================================");
}

class EduPro extends StatelessWidget {
  const EduPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
