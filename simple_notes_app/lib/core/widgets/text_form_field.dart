import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';

// App
TextFormField makeTextFormField({
  TextEditingController? fieldController,
  double? fieldFontSize,
  String? fieldHintText,
  double? fieldHintSize,
}) {
  return TextFormField(
    initialValue: (fieldController == null ? fieldController?.text : null),
    autocorrect: false,
    enableSuggestions: false,
    style: TextStyle(
      color: AppColors.textPrimary,
      fontSize: fieldFontSize,
      fontWeight: .w400,
      decoration: .none,
    ),
    controller: fieldController,
    autofocus: false,
    cursorColor: AppColors.textGrey,
    cursorHeight: 30,
    decoration: InputDecoration(
      border: .none,
      focusedBorder: .none,
      hintText: fieldHintText,
      hintStyle: TextStyle(fontSize: fieldFontSize, color: AppColors.textGrey),
    ),
  );
}
