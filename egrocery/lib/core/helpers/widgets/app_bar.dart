import 'package:flutter/material.dart';

// Constructs the app bars of the app's screens.
AppBar makeAppBarWidgets({String? barTitle, barLeading, barAction}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading:
        barLeading ==
            null // disable auto inserting a leading arrow.
        ? false
        : true,
    leading: barLeading,
    title: Text(
      barTitle ?? "",
      style: TextStyle(fontFamily: "semibold", fontSize: 25, fontWeight: .w700),
    ),
    actions: [
      Padding(padding: EdgeInsetsGeometry.only(right: 10), child: barAction),
    ],
  );
}
