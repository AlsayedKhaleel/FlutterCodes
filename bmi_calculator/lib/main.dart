import 'package:bmi_calculator/features/home/cubit/cubit/home_screen_cubit.dart';
import 'package:bmi_calculator/features/home/view/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(DevicePreview(builder: (c) => BMI_Calc()));
}

// driver class, the 1st point in the app.
class BMI_Calc extends StatelessWidget {
  const BMI_Calc({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); // disable device Auto-rotate feature.
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
