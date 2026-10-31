import 'package:bmi_calculator/core/helpers/app_colors.dart';
import 'package:bmi_calculator/core/helpers/responsive.dart';
import 'package:bmi_calculator/core/widgets/app_bar.dart';
import 'package:bmi_calculator/core/widgets/bottom_navigation_bar.dart';
import 'package:bmi_calculator/features/result/model/user_bmi_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  UserBmiModel userModel;

  ResultScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ResponsiveClass.getScreenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: makeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 40,
                color: AppColors.textPrimary,
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: .circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        // The BMI state colored based on the context.
                        Text(
                          userModel.bmiState ?? "",
                          textAlign: .center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: .bold,
                            color: userModel.bmiColor,
                          ), // Obesity.
                        ),

                        // The user BMI rounded into nearest tens.
                        Text(
                          userModel.userBMI!.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 64,
                            fontWeight: .bold,
                          ),
                        ),

                        // A simple advice based on the BMI index.
                        Text(
                          userModel.stateAdvice ?? "",
                          textAlign: .center,
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        child: makeBottomNavBar("Re - Calculate", screenHeight * 0.1),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
