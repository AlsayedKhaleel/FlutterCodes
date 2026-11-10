import 'package:egrocery/core/helpers/constants.dart';
import 'package:egrocery/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset("$ASSETS/splash_image.svg"),
              SizedBox(height: 15),
              Text(
                "Grocery Plus",
                style: TextStyle(
                  fontWeight: .w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
