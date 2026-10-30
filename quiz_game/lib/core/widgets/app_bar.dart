import 'package:flutter/material.dart';

// This is a shared app bar between all the screens.
AppBar makeAppBar({
  required Text barTitle,
  Widget? barLeading,
  Color barBackgroundColor = Colors.white,
}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: barBackgroundColor,
    leading: barLeading,
    title: barTitle,
  );
}
