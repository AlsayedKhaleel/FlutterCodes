import 'package:flutter/material.dart';
import 'package:test_firebase/core/helpers/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.marinerNormal);
  }
}
