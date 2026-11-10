import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';
import 'package:simple_notes_app/core/widgets/dialog_buttons.dart';

AlertDialog makeAlertDialog({
  required String dialogContent,
  required bool showActions,
  IconData? icon,
  String? dialogTitle,
  void Function()? greenOnTap,
  void Function()? redOnTap,
}) {
  return AlertDialog(
    alignment: .center,
    backgroundColor: AppColors.primaryColor,
    icon: Icon(
      icon,
      size: 30,
      color: icon == Icons.info
          ? AppColors.secondaryColor
          : AppColors.textDiscard,
    ),
    title: Text(dialogTitle ?? ""),
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: .bold,
    ),
    content: Row(mainAxisAlignment: .center, children: [Text(dialogContent)]),
    contentTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: .w400,
      overflow: TextOverflow.ellipsis,
    ),
    actionsAlignment: MainAxisAlignment.spaceAround,
    actions: !showActions
        ? null
        : [
            makeDialogButton("Discard", AppColors.textDiscard, redOnTap),
            makeDialogButton("  Keep  ", AppColors.textConfirm, greenOnTap),
          ],
  );
}

/*
showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return makeAlertDialog(
                                icon: Icons.info,
                                dialogContent:
                                    "Are You Sure To Delete This Note?",
                                dialogActions: [
                                  makeDialogButton(
                                    "Discard",
                                    AppColors.textDiscard,
                                    () {
                                      cubit.deleteNote(index);
                                      Get.back();
                                    },
                                  ),
                                  makeDialogButton(
                                    "  Keep  ",
                                    AppColors.textConfirm,
                                    () => Get.back(),
                                  ),
                                ],
                              );
                            },
                          );
                          */
