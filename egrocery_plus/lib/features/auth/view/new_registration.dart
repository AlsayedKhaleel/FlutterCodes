import 'package:egrocery_plus/core/extensions/name_validation.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/helpers/constants.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/auth/view/create_account_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewRegistrationScreen extends StatelessWidget {
  NewRegistrationScreen({super.key});

  ///Controls the user's full name.
  TextEditingController nameController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // for form's TextFormField's validation.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: makeAppBar(
        label: "Your Information",
        barLeading: Icon(
          Icons.arrow_back,
          color: AppColors.blackNormal,
          size: 30,
        ),
        leadingOnTap: () {
          Navigator.pop(context);
        },
      ),
      body: makeBluralBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "It looks like you don't have account in this number. "
                  "Please let us know some information for a secure service",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .w300,
                    color: AppColors.blackNormal,
                  ),
                ),

                CircleAvatar(
                  backgroundColor: AppColors.greyMedium,
                  radius: 70,
                  child: SvgPicture.asset("$ASSET_REPO/add_profile_image.svg"),
                ),
                SizedBox(height: 30),

                makeCustomButton(
                  btnLabel: "Sync From Facebook",
                  btnColor: AppColors.marinerNormal,
                  labelColor: AppColors.white,
                  btnIcon: Image.asset(
                    "$ASSET_REPO/facebook_icon.png",
                    color: AppColors.white,
                  ),
                  btnOnTap: () => print("Facebook..Facebook....."),
                ),
                SizedBox(height: 30),
                CustomTextfield(
                  fieldHintText: "Full Name",
                  isPasswordField: false,
                  fieldValidator: (value) => value?.isValidName(),
                  fieldColor: AppColors.greyMedium,
                  fieldController: nameController,
                  fieldPreIcon: Icon(CupertinoIcons.profile_circled),
                ),
                SizedBox(height: 30),

                makeCustomButton(
                  btnIcon: Icon(Icons.arrow_forward, color: AppColors.white),
                  btnColor: AppColors.dailyplusGreen,
                  btnLabel: "Next",
                  labelColor: AppColors.white,
                  btnOnTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CreatePasswordScreen(
                                userFullname: nameController.text.trim(),
                              ),
                        ),
                      );
                    } else {
                      print("===============================");
                      print("Not Valid Not Valid Not Valid");
                      print("===============================");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
