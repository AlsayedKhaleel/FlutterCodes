import 'package:bmi_calculator/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

// Creating the same app bar for both screens.
AppBar makeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    automaticallyImplyActions: false,
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    title: Text(
      "BMI Calculator",
      style: TextStyle(
        fontSize: 20,
        fontWeight: .bold,
        color: AppColors.textPrimary,
      ),
    ),
  );
}
