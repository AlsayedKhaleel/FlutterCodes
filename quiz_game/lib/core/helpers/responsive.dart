import 'package:flutter/material.dart';

// this class is to return the build screen's dimensions.
class ResponsiveClass {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
