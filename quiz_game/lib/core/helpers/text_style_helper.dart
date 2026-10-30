import 'package:flutter/material.dart';

// Texts' styles.
TextStyle makeTextStyle({
  required Color textColor,
  required double textSize,
  required FontWeight textWeight,
}) {
  return TextStyle(
    color: textColor,
    fontSize: textSize,
    fontWeight: textWeight,
  );
}
