import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController fieldController = TextEditingController();
  bool isObsecured;
  bool isPasswordField;
  String fieldHintText;
  Widget? fieldPrefixIcon;
  Widget? fieldSuffixIcon;
  String? Function(String?)? fielValidator;

  CustomTextFormField({
    super.key,
    required this.fieldController,
    this.isObsecured = false,
    required this.fieldHintText,
    this.fieldPrefixIcon,
    this.fieldSuffixIcon,
    this.fielValidator,
    required this.isPasswordField,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(8),
        color: Color(0xFFF0F1F2),
      ),
      child: TextFormField(
        autovalidateMode: .onUnfocus,
        validator: widget.fielValidator,
        controller: widget.fieldController,
        obscureText: widget.isObsecured,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.fieldHintText,
          prefixIcon: widget.fieldPrefixIcon,
          suffixIcon: !(widget.isPasswordField)
              ? null
              : InkWell(
                  onTap: () {
                    setState(() {
                      widget.isObsecured = !widget.isObsecured;
                    });
                  },
                  child: Icon(
                    widget.isObsecured
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
        ),
      ),
    );
  }
}
