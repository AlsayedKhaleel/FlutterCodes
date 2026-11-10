import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_firebase/core/helpers/app_colors.dart';
import 'package:test_firebase/core/helpers/hive_helper.dart';
import 'package:test_firebase/core/widgets/custom_button.dart';
import 'package:test_firebase/features/onboarding/constants/onboarding_constants.dart';
import 'package:test_firebase/features/signin/view/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          spacing: 40,
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset("assets/onboarding_$count.svg", fit: .cover),
            Column(
              spacing: 15,
              children: [
                Text(
                  onboardingLabels[count - 1],
                  textAlign: .center,
                  style: TextStyle(
                    fontSize: 32,
                    color: AppColors.blackNormal,
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  onboardingSubtexts[count - 1],
                  textAlign: .center,
                  style: TextStyle(fontSize: 17, color: AppColors.blackNormal),
                ),
              ],
            ),
            SvgPicture.asset("assets/progress_$count.svg", fit: .cover),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                spacing: 10,
                children: [
                  makeCustomButton(
                    btnLabel: "CONTINUE",
                    btnColor: AppColors.marinerNormal,
                    labelColor: AppColors.white,
                    btnOnTap: () {
                      count++;
                      if (count >= 5) {
                        HiveHelper.skipOnboarding();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                  makeCustomButton(
                    btnLabel: "SKIP",
                    btnColor: AppColors.white,
                    labelColor: AppColors.blackNormal,
                    btnOnTap: () {
                      //TODO: Go to the sign in screen.
                      HiveHelper.skipOnboarding();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
