import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String buttonText;
  Color textColor;
  Color buttonColor;
  Widget? rightIcon;

  CustomButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.buttonColor,
    this.rightIcon,
  });

  @override
  State<CustomButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(alignment: .centerRight, child: widget.rightIcon),
          ),
          Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontWeight: .w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}