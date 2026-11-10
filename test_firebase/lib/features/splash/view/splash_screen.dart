import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_firebase/core/helpers/app_colors.dart';
import 'package:test_firebase/core/helpers/hive_helper.dart';
import 'package:test_firebase/features/onboarding/view/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () async {
          if ((await HiveHelper.skipOnboarding()) == false) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
          } else {
            //TODO: What if i did skipped it?
            print("===============================");
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("assets/splash_image.png"),
          ),
        ),
      ),
    );
  }
}
