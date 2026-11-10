import 'package:flutter/material.dart';
import 'package:notes_app/core/helpers/app_colors.dart';

FloatingActionButton makeFloatingActionBtn({
  required void Function() btnOnTap,
  required IconData btnIcon,
  Color? btnColor,
  ShapeBorder? btnShape,
}) {
  return FloatingActionButton(
    shape: btnShape,
    onPressed: btnOnTap,
    backgroundColor: btnColor ?? AppColors.secondaryColor,
    child: Icon(btnIcon, color: AppColors.textPrimary),
  );
}
