part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

///When we still fetching the data from the API.
final class CategoriesLoadingState extends HomeState {}

///IF the categories are fetched successfuly.
final class CategoriesFetchedState extends HomeState {
  final CategoriesResponseModel model;
  CategoriesFetchedState({required this.model});
}

///IF there is an error while loading the data.
final class CategoriesErrorState extends HomeState {
  String errorMessage;
  CategoriesErrorState({required this.errorMessage});
}
