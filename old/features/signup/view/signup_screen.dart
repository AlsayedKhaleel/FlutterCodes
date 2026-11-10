import 'package:edupro/core/helpers/app_colors.dart';
import 'package:edupro/core/widgets/app_bar.dart';
import 'package:edupro/core/widgets/custom_button.dart';
import 'package:edupro/core/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: makeAppBar(label: "Sign Up"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            spacing: 30,
            children: [
              Column(
                crossAxisAlignment: .start,
                spacing: 15,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .bold,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  CustomTextfield(
                    fieldHintText: "Full Name",
                    isPasswordField: false,
                    fieldController: nameController,
                    fieldValidator: (v) {},
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: .start,
                spacing: 15,
                children: [
                  Text(
                    "Email Here",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .bold,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  CustomTextfield(
                    fieldHintText: "Email",
                    isPasswordField: false,
                    fieldController: emailController,
                    fieldValidator: (v) {},
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: .start,
                spacing: 15,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .bold,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  CustomTextfield(
                    fieldHintText: "Password",
                    isPasswordField: true,
                    fieldController: passwordController,
                    fieldValidator: (v) {},
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: .start,
                spacing: 15,
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .bold,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  CustomTextfield(
                    fieldHintText: "Repeat Password",
                    isPasswordField: true,
                    fieldController: confirmPasswordController,
                    fieldValidator: (v) {},
                  ),
                ],
              ),

              makeCustomButton(
                btnLabel: "SIGN UP",
                btnColor: AppColors.marinerNormal,
                labelColor: AppColors.white,
                btnOnTap: () {},
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have An Account? ",
                      style: TextStyle(
                        color: AppColors.blackNormal,
                        fontWeight: .w400,
                        fontSize: 13,
                      ),
                    ),
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer() //TODO: Don't forget to dispose this becasue of memory leaks.
                            ..onTap = () {
                              //TODO: Call the sign up screen here.
                            },
                      text: "Sign In Here",
                      style: TextStyle(
                        color: AppColors.marinerNormal,
                        fontWeight: .bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
