import 'package:bmi_calculator/core/helpers/app_colors.dart';
import 'package:bmi_calculator/core/helpers/responsive.dart';
import 'package:bmi_calculator/core/widgets/app_bar.dart';
import 'package:bmi_calculator/core/widgets/bottom_navigation_bar.dart';
import 'package:bmi_calculator/features/home/cubit/cubit/home_screen_cubit.dart';
import 'package:bmi_calculator/features/result/model/user_bmi_model.dart';
import 'package:bmi_calculator/features/result/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Those 2 top-level variables are here
//  because i can't access the cubit under 'Scaffold's body'
//  to pass the height & weight to the 'ResultScreen' in the bottomNavigationBar.
double? resultUserHeight;
double? resultUserWeight;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // read screen's dimensions.
    final screenHeight = ResponsiveClass.getScreenHeight(context);
    final screenWidth = ResponsiveClass.getScreenWidth(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: makeAppBar(),
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          var cubit = context.read<HomeScreenCubit>();

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: _makeGenderWidget(
                          gender: "male",
                          isSelected: cubit.isMale,
                        ),
                        onTap: () => cubit.changeGender("male"),
                      ),
                    ),

                    // Female Box.
                    Expanded(
                      child: GestureDetector(
                        child: _makeGenderWidget(
                          gender: "female",
                          isSelected: !cubit.isMale,
                        ),
                        onTap: () => cubit.changeGender("female"),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 20,
                          ),
                        ),

                        // This is the changeed user height and the unit (cm).
                        Row(
                          crossAxisAlignment: .end,
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              cubit.userHeight.toInt().toString(),
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 40,
                                fontWeight: .bold,
                              ),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),

                        // That horizontal bar used to change the height.
                        Slider(
                          activeColor: AppColors.watermelonColor,
                          value: cubit.userHeight,
                          min: 10,
                          max: 250,
                          divisions:
                              100, // Makes the bar divided into small dotted sections and show the value specified.
                          label: cubit.userHeight.toInt().toString(),
                          onChanged: (value) {
                            cubit.changeHeight(value);
                            resultUserHeight = cubit.userHeight;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: makeLowerBoxes(
                        boxLabel: "Weight",
                        value: cubit.userWeight.toInt(),
                        plusOnTap: () {
                          cubit.changeWeight(cubit.userWeight + 1);
                          resultUserWeight = cubit.userWeight;
                        },
                        minusOnTap: () {
                          cubit.changeWeight(cubit.userWeight - 1);
                          resultUserWeight = cubit.userWeight;
                        },
                      ),
                    ),

                    Expanded(
                      child: makeLowerBoxes(
                        boxLabel: "Age",
                        value: cubit.userAge,
                        plusOnTap: () => cubit.changeAge(cubit.userAge + 1),
                        minusOnTap: () => cubit.changeAge(cubit.userAge - 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => ResultScreen(
                userModel: UserBmiModel(
                  userHeight: resultUserHeight ?? 1.0,
                  userWeight: resultUserWeight ?? 0,
                ),
              ),
            ),
          );
        },
        child: makeBottomNavBar("Calculate", screenHeight * 0.1),
      ),
    );
  }

  // build the two boxes alnog side of male & female sign.
  Widget _makeGenderWidget({required String gender, required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.selectedGrey : AppColors.primaryColor,
        borderRadius: .circular(12),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            SvgPicture.asset("assets/images/material-symbols_$gender.svg"),

            Text(
              // The gender Label with uppercase initials.
              gender[0].toUpperCase() + gender.substring(1),
              style: TextStyle(fontSize: 20, color: Color(0xFF8B8C9E)),
            ),
          ],
        ),
      ),
    );
  }

  // build the weight & age lower boxes.
  Widget makeLowerBoxes({
    required String boxLabel,
    required int value,
    required Function()? plusOnTap,
    required Function()? minusOnTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Text(
              boxLabel,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textGrey,
                fontWeight: .w400,
              ),
            ),
            Text(
              value.toInt().toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: .bold,
                color: AppColors.textPrimary,
              ),
            ),

            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                GestureDetector(
                  onTap: minusOnTap,
                  child: SvgPicture.asset("assets/images/minus.svg"),
                ),

                GestureDetector(
                  onTap: plusOnTap,
                  child: SvgPicture.asset("assets/images/plus.svg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
