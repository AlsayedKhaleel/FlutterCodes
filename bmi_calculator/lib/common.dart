// make the app bars in the app.
import 'package:flutter/material.dart';

AppBar makeAppBar() {
  return AppBar(
    backgroundColor: Color(0xFF24263B),
    centerTitle: true,
    title: Text(
      "BMI Calculator",
      style: TextStyle(
        fontSize: 20,
        fontWeight: .bold,
        color: Color(0xFFFFFFFF),
      ),
    ),
  );
}

// build the Bottom Navigation Bar of both screens.
Widget makeBottomNavBar(String label) {
  return Container(
    height: 100,
    color: Color(0xFFE83D67),
    child: Center(
      child: Text(
        label,
        style: TextStyle(fontWeight: .bold, fontSize: 32, color: Colors.white),
      ),
    ),
  );
}
