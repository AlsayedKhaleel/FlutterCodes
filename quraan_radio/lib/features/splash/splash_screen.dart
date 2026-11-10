import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quraan_radio/core/helpers/app_colors.dart';
import 'package:quraan_radio/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.neutral),
      backgroundColor: AppColors.neutral,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/splash_screen.svg",
            width: double.infinity,
          ),
          Column(
            children: [
              SvgPicture.asset("assets/images/upper_label.svg", width: 100, height: 100,),
              SvgPicture.asset("assets/images/radio_emblem.svg", height: 400,),
              SvgPicture.asset("assets/images/audio_label.svg"),
              GestureDetector(
                onTap: () {
                  // Get.off(() => HomeScreen());
                  Get.off(() => RadioScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/start_listening.svg"),
                ),
              ),
              SvgPicture.asset("assets/images/bottom_label.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
