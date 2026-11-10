import 'package:edupro/core/helpers/app_colors.dart';
import 'package:edupro/core/widgets/app_bar.dart';
import 'package:edupro/core/widgets/custom_button.dart';
import 'package:edupro/core/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: makeAppBar(label: "Sign In"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // Enter your details to continue learning.

              SvgPicture.asset("assets/insert_mail_password.svg"),

              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Email Here.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .bold,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  CustomTextfield(
                    fieldHintText: "student@university.edu.eg",
                    isPasswordField: false,
                    fieldController: emailController,
                    fieldValidator: (v) {},
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: .start,
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

              Row(
                mainAxisAlignment: .end,
                children: [
                  GestureDetector(
                    onTap: () {
                      //TODO: This will send a firebase reset email requiest to the passed email if valid.
                    },
                    child: Text(
                      "Reset Password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.blackNormal,
                      ),
                    ),
                  ),
                ],
              ),

              makeCustomButton(
                btnLabel: "SIGN IN",
                btnColor: AppColors.marinerNormal,
                labelColor: AppColors.white,
                btnOnTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    //TODO: Call the firebase signin.
                  }
                },
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't Have An Account? ",
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
                      text: "Sign Up Here",
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
