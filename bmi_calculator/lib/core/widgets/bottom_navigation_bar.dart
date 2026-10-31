// make the app bars in the app.
import 'package:bmi_calculator/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

// build the Bottom Navigation Bar of both screens.
Widget makeBottomNavBar(String label, double barHeight) {
  return Container(
    height: barHeight,
    width: double.infinity,
    color: AppColors.watermelonColor,
    child: Center(
      child: Text(
        label,
        style: TextStyle(
          fontWeight: .bold,
          fontSize: 32,
          color: AppColors.textPrimary,
        ),
      ),
    ),
  );
}
