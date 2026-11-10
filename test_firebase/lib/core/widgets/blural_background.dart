import 'package:flutter/cupertino.dart';

///This function is used to build that blural background found behind the widgets in the app's screens.
Widget makeBluralBackground({required Widget child}) {
  return Center(
    child: Stack(
      alignment: .center,
      children: [
        Image.asset(
          "assets/images/splash_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: .fill,
        ),
        child,
      ],
    ),
  );
}
