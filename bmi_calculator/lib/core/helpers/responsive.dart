import 'package:flutter/material.dart';

/// returns the screen's dimensions.
class ResponsiveClass {
  // get the height of the context screen.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // get the width of the context screen.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
