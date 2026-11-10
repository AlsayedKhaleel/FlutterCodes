import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/login/cubit/cubit/login_cubit.dart';

class CustomButton extends StatefulWidget {
  String buttonText;
  Color textColor;
  Color buttonColor;
  Widget? rightIcon;
  void Function()? buttonOnTap;

  CustomButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.buttonColor,
    this.rightIcon,
    required this.buttonOnTap,
  });

  @override
  State<CustomButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return InkWell(
          onTap: state is IsLoading ? null : widget.buttonOnTap,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Align(
                    alignment: .centerRight,
                    child: widget.rightIcon,
                  ),
                ),
                state is IsLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Center(
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
          ),
        );
      },
    );
  }
}
