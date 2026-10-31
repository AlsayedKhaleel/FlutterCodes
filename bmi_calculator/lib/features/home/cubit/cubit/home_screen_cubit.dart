import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  double userHeight = 10.0;
  int userAge = 1;
  double userWeight = 1;
  bool isMale = true;

  // when the user changing his gender.
  void changeGender(String boxName) {
    emit(GenderChangeState());
    isMale = (boxName == "male" ? true : false);
  }

  // moving the slider back and forth.
  void changeHeight(double height) {
    emit(HeightChangeState());
    if (height >= 0) {
      userHeight = height;
    }
  }

  // changing the weight.
  void changeWeight(double weight) {
    emit(WeightChangeState());
    if (weight >= 0) {
      userWeight = weight;
    }
  }

  // the age change.
  void changeAge(int age) {
    emit(AgeChangeState());
    if (age >= 0) {
      userAge = age;
    }
  }
}
