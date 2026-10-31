import 'package:bmi_calculator/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class UserBmiModel {
  double userHeight;
  double userWeight;

  // used ONLY inside the class.
  double? userBMI;
  String? bmiState;
  String? stateAdvice;
  Color? bmiColor;
  int? _stateIndex;

  UserBmiModel({required this.userHeight, required this.userWeight}) {
    userBMI = userWeight * 10000 / (userHeight * userHeight);
    _stateIndex = UserBmiModel._getStateIndex(userBMI!);

    bmiState = UserBmiModel._possibleBmiStates[_stateIndex!];
    stateAdvice = UserBmiModel._statesAdvices[_stateIndex!];
    bmiColor = UserBmiModel._statesColors[_stateIndex!];
  }

  // we have 4 possible states in the BMI system.
  static final List<String> _possibleBmiStates = [
    "Underweight",
    "Normal",
    "Overweight",
    "Obesity",
  ];

  // some advices for each state.
  static final List<String> _statesAdvices = [
    "Ensure you get enough nutrient-dense energy is highly important. Focus on adding protein, healthy fats, and balanced meals to your routine to build up your physical strength and daily stamina.",
    "Your current lifestyle is doing a fantastic job supporting your body. Keep up the excellent work by staying active, eating well, and protecting your long-term wellness!",
    "Keep in mind that BMI is just a general guide and doesn't separate muscle from fat. Focus on nurturing your body with regular, enjoyable movement and small, sustainable daily habits that keep your heart healthy and your energy high.",
    "Carrying extra weight can sometimes impact your joints, daily energy, or long-term health. Focus on gentle, steady lifestyle shifts rather than strict dieting, and consider speaking with a healthcare professional for personalized guidance",
  ];

  // the level of danger based on the situation.
  static final List<Color> _statesColors = [
    AppColors.textLowWarning,
    AppColors.textSafe,
    AppColors.textWarning,
    AppColors.textDanger,
  ];

  // controls which message, color, and advice will be
  //  printed for the user using the corresponding index.
  static int _getStateIndex(double BMI) {
    if (BMI < 18.5) {
      return 0;
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return 1;
    } else if (BMI >= 25 && BMI <= 29.9) {
      return 2;
    } else {
      return 3;
    }
  }
}
