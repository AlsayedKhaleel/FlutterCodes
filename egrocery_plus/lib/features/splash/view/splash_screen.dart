import 'package:egrocery_plus/core/helpers/constants.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/features/auth/view/enter_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (BuildContext context) => MailSignInScreen(),
            ),
          );
        },
        child: makeBluralBackground(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset("$ASSET_REPO/splash_image.svg"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                child: Text(
                  "Grocery Plus",
                  style: TextStyle(
                    fontWeight: .w600,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
