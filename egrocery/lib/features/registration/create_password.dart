import 'package:egrocery/core/helpers/constants.dart';
import 'package:egrocery/core/helpers/widgets/app_bar.dart';
import 'package:egrocery/core/helpers/widgets/custom_button.dart';
import 'package:egrocery/core/helpers/widgets/text_form_field.dart';
import 'package:egrocery/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordObsecured = true;
  bool isConfirmPasswordObsecured = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBarWidgets(barTitle: "Choose a Password"),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 73,
                    child: Text(
                      "For the security & safety please choose a password",
                      style: TextStyle(fontWeight: .w400, fontSize: 15),
                    ),
                  ),

                  SvgPicture.asset("$ASSETS/create_password.svg"),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    fieldController: passwordController,
                    isObsecured: true,
                    fieldHintText: "Password",
                    fielValidator: (value) {
                      if (value!.length <= 6) {
                        return "Password Length must be > 6";
                      }

                      return null;
                    },
                    fieldPrefixIcon: Icon(Icons.lock_outline, size: 22),
                    isPasswordField: true,
                  ),
                  SizedBox(height: 20),

                  CustomTextFormField(
                    isObsecured: true,
                    isPasswordField: true,
                    fielValidator: (value) {
                      if (value!.length <= 6) {
                        return "Password Length must be > 6";
                      }

                      return null;
                    },
                    fieldController: confirmPasswordController,
                    fieldHintText: "Confirm Password",
                    fieldPrefixIcon: Icon(Icons.lock_outline, size: 22),
                  ),

                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          ),
                          ModalRoute.withName(
                            '/',
                          ), // Replace this with your root screen's route name (usually '/')
                        );
                      }
                    },
                    child: CustomButton(
                      buttonText: "Finish, Good To Go",
                      textColor: Colors.white,
                      buttonColor: Color(0xFF5EC401),
                      rightIcon: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
