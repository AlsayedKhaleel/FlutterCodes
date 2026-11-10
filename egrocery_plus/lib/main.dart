import 'package:egrocery_plus/core/helpers/hive_helper.dart';
import 'package:egrocery_plus/features/home/cubit/cubit/home_cubit.dart';
import 'package:egrocery_plus/features/home/model/categories_response_model.dart';
import 'package:egrocery_plus/features/home/view/home_page.dart';
import 'package:egrocery_plus/features/more/view/more_screen.dart';
import 'package:egrocery_plus/features/orders/view/orders_screen.dart';
import 'package:egrocery_plus/features/products/cubit/cubit/products_cubit.dart';
import 'package:egrocery_plus/features/products/view/products_screen.dart';
import 'package:egrocery_plus/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/splash/view/splash_screen.dart';

CategoriesResponseModel? categoriesResponseModel;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox(HiveHelper.userStorageBox); // open the box.
  await HiveHelper.loadKnownEmails(); // load the know emails.
  // HiveHelper.storeEmail('alice@example.com');
  // HiveHelper.storePassword('password123');
  runApp(const EGrocery());
}

class EGrocery extends StatelessWidget {
  const EGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      // home: MoreScreen(),
      // home: BlocProvider(
      //   create: (context) => ProductsCubit()..fetchProducts(),
      //   child: ProductsScreen(categoryId: 1, categoryName: "Name"),
      // ),

      // BlocProvider(
      //   create: (context) => HomeCubit()..getCategories(),
      //   child: HomeScreen(isHomeScreen: false),
      // ),
    ); // CategoriesScreen
    // return GetMaterialApp(home: SplashScreen()); // CategoriesScreen
  }
}
