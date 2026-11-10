import 'package:flutter/material.dart';

///This function build the buttons of the application.
Widget makeCustomButton({
  required String btnLabel,
  required Color btnColor,
  required Color labelColor,
  required void Function() btnOnTap,
  bool isPreIcon = false,
  double? btnFontSize,
  Widget? btnIcon,
}) {
  return GestureDetector(
    onTap: btnOnTap,
    child: Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        // alignment: .centerRight,
        children: [
          Align(
            alignment: isPreIcon ? .centerLeft : .centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: btnIcon,
            ),
          ),

          Center(
            child: Text(
              btnLabel,
              style: TextStyle(
                color: labelColor,
                fontSize: btnFontSize ?? 20,
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
