part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

// when the user selected the gener box.
final class GenderChangeState extends HomeScreenState {}

// when they change their height.
final class HeightChangeState extends HomeScreenState {}

// change their weight.
final class WeightChangeState extends HomeScreenState {}

// finally, their age.
final class AgeChangeState extends HomeScreenState {}
