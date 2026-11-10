import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_api/core/api/endpoint_api.dart';
import 'package:login_api/home/home_page.dart';
import 'package:login_api/login/model/response_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String email, required String password}) async {
    emit(IsLoading());
    
    // fetched the response from the API.
    var response = await EndpointAPI.postMethod(
      target: "login",
      body: {"email": email, "password": password},
    );

    // Stored the response's data section in an object.
    var responseData = response.data as Map<dynamic, dynamic>;
    ResponseModel responseModel = ResponseModel.fromJson(responseData);

    // based on the reponse's status code, we gonna take an action(s).
    if (responseModel.statusCode == 200) {
      Get.to(HomePage(userData: responseModel.data));
      print("====================================================");
      print("Login Sucessed");
      print("====================================================");
      // Get.to(HomePage(userData: responseModel.data));
      Get.snackbar("Success", "lkasdjfads", backgroundColor: Colors.green);
      emit(SuccessLogin());
    } else {
      Get.snackbar("Fail", "lkasdjfads", backgroundColor: Colors.red);
      emit(FailedLogin());
    }
  }
}
