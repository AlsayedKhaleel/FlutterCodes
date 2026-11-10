import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:login_api/login/cubit/cubit/login_cubit.dart';
import 'package:login_api/login/view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginPage(),
      ),
    );
  }
}
