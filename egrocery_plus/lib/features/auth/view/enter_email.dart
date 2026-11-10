import 'package:dio/dio.dart' as DIO;
import 'package:egrocery_plus/core/extensions/email_validation.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/helpers/constants.dart';
import 'package:egrocery_plus/core/helpers/hive_helper.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/auth/view/new_registration.dart';
import 'package:egrocery_plus/features/auth/view/registered_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MailSignInScreen extends StatelessWidget {
  MailSignInScreen({super.key});
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: makeBluralBackground(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                "$ASSET_REPO/splash_en_mail.svg",
                fit: .fitWidth,
                width: double.infinity,
              ),

              Column(
                crossAxisAlignment: .start,
                spacing: 20,
                children: [
                  Text(
                    "Enter Your Email address",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .w600,
                      color: AppColors.blackNormal,
                    ),
                  ),
                  Text(
                    "We need to verify you. We will send you a one time verification code.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .w300,
                      color: AppColors.blackNormal,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              CustomTextfield(
                fieldController: emailController,
                fieldHintText: "Email Address",
                fieldValidator: (email) => email?.isValidEmail(),
                isPasswordField: false,
                fieldPreIcon: Icon(Icons.email),
              ),

              // Spacer(),
              SizedBox(height: 40),
              makeCustomButton(
                btnLabel: "Next",
                btnColor: AppColors.dailyplusGreen,
                labelColor: AppColors.white,
                btnIcon: Icon(Icons.arrow_forward, color: AppColors.white),
                btnOnTap: () {
                  // IF the user entered a valid email.
                  if (_formKey.currentState!.validate()) {
                    // check either this email is known for us, or it is new.
                    if (HiveHelper.isKnownEmail(emailController.text.trim())) {
                      HiveHelper.addEmail2Register(emailController.text.trim());

                      // If it is known, we will take the password.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisteredEmailScreen(),
                        ),
                      );
                      // Get.to(() => RegisteredEmailScreen());
                    } else {
                      // If not, we gonna complete the registration process [name, password].
                      HiveHelper.addEmail2Register(emailController.text.trim());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewRegistrationScreen(),
                        ),
                      );
                      // Get.to(() => NewRegistrationScreen());
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
