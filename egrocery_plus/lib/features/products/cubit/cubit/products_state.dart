part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

///Loading the products from the API.
final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  ProductsResponseModel model;
  ProductsLoadedState({required this.model});
}

///If we got an error while loading the products.
final class ProductsErrorState extends ProductsState {
  String errorMessage;
  ProductsErrorState({required this.errorMessage});
}
