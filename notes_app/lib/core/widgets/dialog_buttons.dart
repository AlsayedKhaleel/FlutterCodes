import 'package:flutter/material.dart';
import 'package:notes_app/core/helpers/app_colors.dart';

Widget makeDialogButton(String label, Color color, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 20),
        ),
      ),
    ),
  );
}
