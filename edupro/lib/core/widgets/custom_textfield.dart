import 'package:edupro/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

///This class is a customized text form field for performance & usability purposes.
class CustomTextfield extends StatefulWidget {
  String fieldHintText;
  Widget? fieldPreIcon;
  void Function()? postOnTap;
  String? Function(String?)? fieldValidator;
  bool isPasswordField;
  bool _isObsecuredField = false;
  TextEditingController fieldController;
  Color? fieldColor;
  // TextInputType? fieldKeyboard;

  CustomTextfield({
    super.key,
    required this.fieldHintText,
    required this.isPasswordField,
    required this.fieldController,
    required this.fieldValidator,
    this.fieldColor,
    this.fieldPreIcon,

    // this.fieldSuffixIcon,
  }) {
    _isObsecuredField = isPasswordField;
  }

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.fieldValidator,
      controller: widget.fieldController,
      obscureText: widget._isObsecuredField,
      keyboardType: .emailAddress,
      decoration: InputDecoration(
        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.greyExtra),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.greyExtra,
          ),
        ),
        // borderSide:
        filled: true,
        fillColor:AppColors.white,
        hintText: widget.fieldHintText,
        contentPadding: EdgeInsets.only(left: 10),
        // hint: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Text(
        //     widget.fieldHintText,
        //     style: TextStyle(
        //       color: AppColors.blackNormal,
        //       fontWeight: .w400,
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        prefixIcon: widget.fieldPreIcon,
        suffixIcon: widget.isPasswordField
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget._isObsecuredField = !widget._isObsecuredField;
                  });
                },
                child: Icon(
                  widget._isObsecuredField
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
