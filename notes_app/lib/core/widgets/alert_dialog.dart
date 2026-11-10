import 'package:flutter/material.dart';
import 'package:notes_app/core/helpers/app_colors.dart';

AlertDialog makeAlertDialog({
  required String dialogContent,
  IconData? icon,
  String? dialogTitle,
  List<Widget>? dialogActions,
}) {
  return AlertDialog(
    backgroundColor: AppColors.primaryColor,
    icon: Icon(icon),
    title: Text(
      dialogTitle ?? "",
      style: TextStyle(fontSize: 20, fontWeight: .bold),
    ),
    titleTextStyle: TextStyle(color: AppColors.textPrimary),
    actions: dialogActions,
    actionsAlignment: MainAxisAlignment.spaceAround,
    content: Text(dialogContent),
    contentTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: .w400,
    ),
  );
}
