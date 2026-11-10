import 'package:edupro/core/helpers/hive_helper.dart';
import 'package:edupro/features/signin/view/signin_screen.dart';
import 'package:edupro/features/signup/view/signup_screen.dart';
import 'package:edupro/features/splash/view/splash_screen.dart';
import 'package:edupro/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
