import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:login_api/core/api/endpoint_api.dart';
import 'package:login_api/login/cubit/cubit/login_cubit.dart';
import 'package:login_api/login/model/response_model.dart';
import 'package:login_api/login/view/custom_button.dart';
import 'package:login_api/home/home_page.dart';
import 'package:login_api/login/view/text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "User Verfication",
          style: TextStyle(
            color: Colors.black,
            fontWeight: .bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.lock_outline_rounded, size: 50),
          ),

          SizedBox(height: 20),
          CustomTextFormField(
            fieldController: emailController,
            fieldHintText: "Email",
            isPasswordField: false,
            fieldPrefixIcon: Icon(Icons.manage_accounts),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            fieldController: passwordController,
            fieldHintText: "Password",
            isPasswordField: true,
            isObsecured: true,
            fieldPrefixIcon: Icon(Icons.lock),
          ),
          SizedBox(height: 20),

          CustomButton(
            buttonOnTap: () async {
              cubit.login(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            },
            buttonText: "Login",
            textColor: Colors.white,
            buttonColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
