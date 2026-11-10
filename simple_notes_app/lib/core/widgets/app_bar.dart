import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';

// Build screens' appBars.
AppBar makeAppBar({
  Widget? barLeading,
  String? barTitle,
  List<Widget>? barActions,
}) {
  return AppBar(
    automaticallyImplyActions: false,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.primaryColor,
    leading: barLeading,
    title: Text(
      barTitle ?? "",
      style: TextStyle(
        fontWeight: .w500,
        fontSize: 44,
        color: AppColors.textPrimary,
      ),
    ),
    centerTitle: false,
    actions: barActions,
  );
}
