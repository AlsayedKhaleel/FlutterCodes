import 'package:flutter/material.dart';

// Customize the buttons with different variations.
Widget makeCustomButton({
  required String buttonText,
  required Color textColor,
  required Color buttonColor,
  required Icon buttonIcon,
  bool isPrefixIcon = false,
}) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: buttonColor,
    ),
    child: Row(
      mainAxisAlignment: .center,
      children: [
        if (isPrefixIcon) buttonIcon,
        Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 20, fontWeight: .bold),
        ),

        if (!isPrefixIcon) buttonIcon,
      ],
    ),
  );
}
