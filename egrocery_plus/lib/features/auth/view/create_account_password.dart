import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:egrocery_plus/core/enums/api_status_codes.dart';
import 'package:egrocery_plus/core/extensions/password_validation.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/helpers/constants.dart';
import 'package:egrocery_plus/core/helpers/hive_helper.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/auth/model/register_model.dart';
import 'package:egrocery_plus/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as Routing;
import 'package:get/get_core/src/get_main.dart';

class CreatePasswordScreen extends StatelessWidget {
  String userFullname;
  CreatePasswordScreen({super.key, required this.userFullname});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(
        label: "Choose a Password",
        barLeading: Icon(
          Icons.arrow_back,
          color: AppColors.blackNormal,
          size: 30,
        ),
        leadingOnTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      body: makeBluralBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "For the security & safety please choose a password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .w300,
                    color: AppColors.blackNormal,
                  ),
                ),
                SvgPicture.asset(
                  "$ASSET_REPO/choose_password_image.svg",
                  fit: .cover,
                ),

                CustomTextfield(
                  fieldHintText: "Password",
                  isPasswordField: true,
                  fieldController: passwordController,
                  fieldValidator: (password) => password?.isValidPassword(),
                ),
                CustomTextfield(
                  fieldHintText: "Confirm Password",
                  isPasswordField: true,
                  fieldController: confirmPasswordController,
                  fieldValidator: (password) => password?.isValidPassword(),
                ),

                makeCustomButton(
                  btnLabel: "Finish, Good to go",
                  btnColor: AppColors.dailyplusGreen,
                  labelColor: AppColors.white,
                  btnOnTap: () async {
                    ///TODO: The next steps are:
                    //TODO: What if the app is not connected to the internet?
                    /// 1. Register this user using API.
                    /// 2. Store it as known email.
                    /// 3. Create a Model to maintain the response.data.
                    /// 4. Route the use to HomeScreen.

                    // User entered a new valid email.
                    if (_formkey.currentState!.validate() &&
                        passwordController.text ==
                            confirmPasswordController.text) {
                      try {
                        //Register this user on the system using 'register API'.
                        Response response = await ApiHelper.userRegister(
                          email: HiveHelper.userEmail,
                          password: passwordController.text.trim(),
                          name: userFullname,
                        );
                        print("===============================");
                        print("$response");
                        print("===============================");

                        //! If there is an internet communication and the client reached the server and got a response back.
                        if (response.statusCode ==
                            ApiStatusCodes.reachServerSuccess) {
                          RegisterResponseModel registerResponseModel =
                              RegisterResponseModel.fromJson(response.data);

                          if (registerResponseModel.statusCode ==
                              ApiStatusCodes.successfulRegistration) {
                            // register this email localy after being registered remotely.
                            // HiveHelper.addKnownEmail(HiveHelper.email2Register);
                            // HiveHelper.storeToken(
                            //   registerResponseModel.data?.token,
                            // );
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(isHomeScreen: true,),
                              ),
                              (Route<dynamic> route) => false,
                            );
                            // Routing.Get.offAll(() => HomeScreen());
                          } else {}
                          print("===============================");
                          print("$registerResponseModel");
                          print("===============================");
                          // Routing.Get.to(() => HomeScreen());
                        } else {
                          print("===============================");
                          print("Go To Home Screen");
                          print("===============================");
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Oops!',
                        desc: 'Passwords MUST be the same.',
                      ).show();
                    }
                  },
                  btnIcon: Icon(Icons.arrow_forward, color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
