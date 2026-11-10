import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/features/home/model/categories_response_model.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  ///Fetches the categories from the API.
  void getCategories() async {
    emit(CategoriesLoadingState());
    try {
      Response response =
          await ApiHelper.getCategories(); //! Can cause an exception.
      var categoriesModel = CategoriesResponseModel.fromJson(response.data);
      if (!isClosed) emit(CategoriesFetchedState(model: categoriesModel));
    } catch (e) {
      // if the cubit is not closed (the screen is still there), and got an exception because of the network API call.
      if (!isClosed) {
        emit(CategoriesErrorState(errorMessage: e.toString()));
      }
    }
  }
}

// void fetchCategories() async {
//   try {
//     final response = await ApiHelper.getCategories();
//     if (mounted) {
//       setState(() {
//         categoriesModel = CategoriesResponseModel.fromJson(response.data);
//         isLoading = false; // Data is ready
//       });
//     }
//   } catch (e) {
//     if (mounted) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//     // Handle error here (e.g., show a snackbar)
//   }
// }
