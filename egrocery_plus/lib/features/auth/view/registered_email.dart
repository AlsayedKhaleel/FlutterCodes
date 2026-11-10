import 'package:dio/dio.dart' as DIO;
import 'package:egrocery_plus/core/enums/api_status_codes.dart';
import 'package:egrocery_plus/core/extensions/password_validation.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/helpers/constants.dart';
import 'package:egrocery_plus/core/helpers/hive_helper.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/auth/model/register_model.dart';
import 'package:egrocery_plus/features/home/cubit/cubit/home_cubit.dart';
import 'package:egrocery_plus/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as Routing;

class RegisteredEmailScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();

  RegisteredEmailScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: makeBluralBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                SvgPicture.asset(
                  "$ASSET_REPO/splash_en_password.svg",
                  fit: .cover,
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Enter the password",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .w600,
                          color: AppColors.blackNormal,
                        ),
                      ),
                    ),
                    Text(
                      "It looks like you already have an account in this email. Please enter the password to proceed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .w300,
                        color: AppColors.blackNormal,
                      ),
                    ),
                  ],
                ),

                CustomTextfield(
                  fieldController: passwordController,
                  fieldHintText: "Password",
                  fieldValidator: (password) => password?.isValidPassword(),
                  isPasswordField: true,
                  fieldPreIcon: Icon(Icons.lock),
                ),
                SizedBox(height: 20),

                makeCustomButton(
                  btnLabel: "Next",
                  btnColor: AppColors.dailyplusGreen,
                  labelColor: AppColors.white,
                  btnIcon: Icon(Icons.arrow_forward, color: AppColors.white),
                  btnOnTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // Now we have the email & password, check them using the API.
                      DIO.Response response = await ApiHelper.userLogin(
                        email: HiveHelper.userEmail,
                        password: passwordController.text.trim(),
                      );

                      print("===========================================");
                      print(response);
                      print(HiveHelper.userEmail);
                      print(passwordController.text);
                      print("===========================================");

                      // return ;
                      //TODO: You can access the user's data from here.
                      RegisterResponseModel userReturnResponse =
                          RegisterResponseModel.fromJson(response.data);

                      // This status_code and userReturnResponse are not the same,
                      //  The former is the communication status with the server.
                      //  The latter is the API operation status after the server responded.
                      if (response.statusCode !=
                          ApiStatusCodes.reachServerSuccess) {
                        Routing.Get.snackbar(
                          "Error",
                          "Can't reach the data.",
                          backgroundColor: AppColors.persimmonNormal,
                        );
                        // This user has an account on the app.
                      } else if (userReturnResponse.statusCode ==
                          ApiStatusCodes.successfulLogin) {
                        HiveHelper.storePassword(passwordController.text);
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) => BlocProvider(
                              create: (context) => HomeCubit()..getCategories(),
                              child: HomeScreen(isHomeScreen: true),
                            ),
                          ),
                          (Route<dynamic> route) => false,
                        );

                        //TODO: We have to store the user's token, haven't we?
                        //! HiveHelper.storeToken(userReturnResponse.data?.token);
                      } else {
                        Routing.Get.snackbar(
                          "Failed",
                          userReturnResponse.message ?? "",
                          backgroundColor: AppColors.persimmonNormal,
                        );
                      }
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
