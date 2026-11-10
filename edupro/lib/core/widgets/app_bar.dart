import 'package:edupro/core/helpers/app_colors.dart';
import 'package:edupro/core/helpers/constants.dart';
import 'package:flutter/material.dart';

AppBar makeAppBar({
  required String label,
  void Function()? leadingOnTap,
  void Function()? ationOnTap,
  Widget? barAction,
  Widget? barLeading,
}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyActions: false,
    automaticallyImplyLeading: false,
    leading: barLeading != null
        ? GestureDetector(
            onTap: leadingOnTap,
            child: Icon(
              Icons.arrow_back,
              color: AppColors.blackNormal,
              size: 30,
            ),
          )
        : null,
    title: Text(
      label,
      style: TextStyle(
        color: AppColors.blackNormal,
        fontSize: 32,
        fontWeight: .bold,
      ),
    ),
    actions: barAction != null
        ? [
            GestureDetector(
              onTap: ationOnTap,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: barAction,
              ),
            ),
          ]
        : null,
  );
}
