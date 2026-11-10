import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/features/products/model/products_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  void fetchProducts() async {
    emit(ProductsLoadingState());

    try {
      Response response = await ApiHelper.getProducts();
      if (!isClosed) {
        emit(
          ProductsLoadedState(
            model: ProductsResponseModel.fomJson(response.data),
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(ProductsErrorState(errorMessage: e.toString()));
      }
    }
  }
}
