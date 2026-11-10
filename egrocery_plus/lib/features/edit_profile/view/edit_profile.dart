import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/more/model/user_model.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  UserModel userModel;
  TextEditingController? fullNameController;
  TextEditingController? passwordController;
  TextEditingController? emailController;

  EditProfile({super.key, required this.userModel}) {
    fullNameController = TextEditingController(text: userModel.name);
    passwordController = TextEditingController(text: userModel.email);
    emailController = TextEditingController(text: userModel.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(
        label: "Edit Profile",
        barLeading: Icon(Icons.arrow_back, color: AppColors.blackNormal),
        leadingOnTap: () => Navigator.of(context).pop(),
      ),
      body: makeBluralBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 30,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Stack(
                  alignment: .bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/09/61/69/75/360_F_961697523_EFd1m8P4tdcwB0TYvlQAagqKR1xHSuwk.jpg",
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.tangoNormal,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              CustomTextfield(
                fieldPreIcon: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: AppColors.blackNormal,
                ),
                fieldHintText: "Full Name",
                isPasswordField: false,
                fieldController: fullNameController!,
                fieldValidator: (v) {
                  return null;
                },
              ),
              CustomTextfield(
                fieldPreIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.blackNormal,
                ),
                fieldHintText: "Password",
                isPasswordField: true,
                fieldController: passwordController!,
                fieldValidator: (v) {
                  return null;
                },
              ),
              CustomTextfield(
                fieldPreIcon: Icon(Icons.email, color: AppColors.blackNormal),
                fieldHintText: "Email",
                isPasswordField: false,
                fieldController: emailController!,
                fieldValidator: (v) {
                  return null;
                },
              ),

              Spacer(),
              makeCustomButton(
                btnLabel: "Save",
                btnColor: AppColors.dailyplusGreen,
                labelColor: AppColors.white,
                btnIcon: Icon(Icons.save_outlined, color: AppColors.white),
                btnOnTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
