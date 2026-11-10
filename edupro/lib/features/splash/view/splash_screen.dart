import 'package:edupro/core/helpers/app_colors.dart';
import 'package:edupro/core/helpers/hive_helper.dart';
import 'package:edupro/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

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
