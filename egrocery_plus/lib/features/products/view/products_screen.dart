import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/core/widgets/custom_button.dart';
import 'package:egrocery_plus/features/products/cubit/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  int categoryId;
  String categoryName;
  ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(
        label: categoryName,
        barLeading: Icon(Icons.arrow_back),
        leadingOnTap: () {
          Navigator.of(context).pop();
        },
      ),

      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoadedState) {

            final model = state.model.data?.where((e) => e.categoryId == categoryId).toList();

            return SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 290, // controls the child's height.
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: AppColors.greyNormal,
                              ),
                            ),

                            Center(
                              child: Image.network(
                                model?[index].image ?? "",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          model?[index].name ?? "",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: .bold,
                            color: AppColors.blackNormal,
                          ),
                        ), // price.
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "\$${model?[index].price}",
                              style: TextStyle(
                                color: AppColors.tangoNormal,
                                fontSize: 16,
                                fontWeight: .w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            makeCustomButton(
                              btnLabel: "Add To Bag",
                              isPreIcon: true,
                              btnFontSize: 17,
                              btnIcon: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                              btnColor: AppColors.dailyplusGreen,
                              labelColor: AppColors.greyNormal,
                              btnOnTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                itemCount: model?.length,
              ),
            );
          } else {
            return state is ProductsErrorState
                ? Text(state.errorMessage)
                : Text("");
          }
        },
      ),
    );
  }
}
