import 'package:dio/dio.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/core/widgets/blural_background.dart';
import 'package:egrocery_plus/core/widgets/custom_textfield.dart';
import 'package:egrocery_plus/features/home/cubit/cubit/home_cubit.dart';
import 'package:egrocery_plus/features/home/model/categories_response_model.dart';
import 'package:egrocery_plus/features/products/cubit/cubit/products_cubit.dart';
import 'package:egrocery_plus/features/products/view/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final bool isHomeScreen;
  const HomeScreen({super.key, required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    // context.read<HomeCubit>().getCategories();
    return Scaffold(
      backgroundColor: AppColors.greyNormal,
      appBar: makeAppBar(
        label: isHomeScreen ? "Grocery Plus" : "Category",
        leadingOnTap: () {},
        barAction: Icon(
          CupertinoIcons.bell,
          color: AppColors.blackNormal,
          size: 30,
        ),
      ),
      body: makeBluralBackground(
        child: Column(
          children: [
            //Toggle this part if the screen is either the HomeScreen or CategoryScreen.
            if (isHomeScreen)
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.dailyplusWhiteGreen,
                        radius: 30,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Your Location",
                            style: TextStyle(
                              color: AppColors.blackNormal,
                              fontSize: 15,
                              fontWeight: .w400,
                            ),
                          ),
                          Text(
                            "32 Llanberis Close, Tonteg, CF38 1HR",
                            style: TextStyle(
                              color: AppColors.blackNormal,
                              fontSize: 15,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.blackNormal,
                      ),
                    ],
                  ),
                  CustomTextfield(
                    fieldPreIcon: Icon(Icons.search),
                    fieldHintText: "Search Anything",
                    isPasswordField: false,
                    fieldController: SearchController(),
                    fieldValidator: null,
                  ),
                ],
              ),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                //! The same screen appears 2 times, with just this part as a difference,
                //!  i used this trick to not repeat myself in this screen.

                if (state is CategoriesLoadingState) {
                  return CircularProgressIndicator();
                }

                if (state is CategoriesFetchedState) {
                  final model = state.model;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: .center,
                        children: [
                          // Your existing commented layout remains valid here...
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                print(model.categories?[index].id);
                                print(model.categories?[index].description);
                                //TODO: Open the category screen with the data of products of that category pressed.

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BlocProvider(
                                          create: (context) =>
                                              ProductsCubit()..fetchProducts(),
                                          child: ProductsScreen(
                                            categoryId:
                                                model.categories?[index].id ??
                                                0,
                                            categoryName:
                                                model.categories?[index].name ??
                                                "",
                                          ),
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: .all(15),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.network(
                                        "${model.categories?[index].image}",
                                      ),
                                    ),

                                    Text(
                                      model.categories?[index].name ?? "",
                                      style: TextStyle(
                                        color: AppColors.blackNormal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: model.categories?.length,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text("No Data Requested Yet."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
