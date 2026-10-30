import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/helpers/app_colors.dart';
import 'package:quiz_game/core/helpers/responsive.dart';
import 'package:quiz_game/core/helpers/text_style_helper.dart';
import 'package:quiz_game/core/widgets/app_bar.dart';
import 'package:quiz_game/features/question/cubit/cubit/question_cubit.dart';
import 'package:quiz_game/features/question/view/questions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: makeAppBar(
        barTitle: Text(
          "QuizMaster",
          style: makeTextStyle(
            textColor: Colors.blueAccent,
            textSize: 30,
            textWeight: .w400,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveClass.getScreenWidth(context) * 0.02,
          vertical: ResponsiveClass.getScreenHeight(context) * 0.15,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 158, 203, 255),
                child: Icon(
                  Icons.lightbulb_sharp,
                  color: AppColors.primaryColor,
                  size: 60,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Ready For A Challenge?",
                      style: makeTextStyle(
                        textColor: AppColors.primaryColor,
                        textSize: 25,
                        textWeight: .w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Drop in for a quick round of global trivia!!\nReady to test your world smarts?",
                      style: makeTextStyle(
                        textColor: AppColors.primaryColor,
                        textSize: 14,
                        textWeight: .w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Start the game button.
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => QuestionCubit(),
                        child: QuestionsScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30,
                    ),
                    child: Text(
                      "Start Quiz Now",
                      style: makeTextStyle(
                        textColor: AppColors.secondaryColor,
                        textSize: 25,
                        textWeight: .bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
