import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/helpers/app_colors.dart';
import 'package:quiz_game/core/helpers/responsive.dart';
import 'package:quiz_game/core/helpers/text_style_helper.dart';
import 'package:quiz_game/core/widgets/app_bar.dart';
import 'package:quiz_game/core/widgets/custom_button.dart';
import 'package:quiz_game/features/home/view/home_screen.dart';
import 'package:quiz_game/features/question/cubit/cubit/question_cubit.dart';
import 'package:quiz_game/features/result/result_page.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = ResponsiveClass.getScreenHeight(context);
    final screenWidth = ResponsiveClass.getScreenWidth(context);

    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        var cubit = context.read<QuestionCubit>();

        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: makeAppBar(
            barLeading: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            barTitle: Text(
              "Quiz",
              style: makeTextStyle(
                textColor: Colors.black,
                textSize: 30,
                textWeight: .bold,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.030,
              horizontal: screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(
                      "Question ${cubit.currentQuestionNo} of ${cubit.gameLength}",
                      style: makeTextStyle(
                        textColor: Colors.black,
                        textSize: 18,
                        textWeight: .w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${(((cubit.currentQuestionNo - 1) / cubit.gameLength) * 100).toInt()}% Completed",
                      style: makeTextStyle(
                        textColor: Colors.black,
                        textSize: 18,
                        textWeight: .w600,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LinearProgressIndicator(
                    borderRadius: .circular(20),
                    value: (cubit.currentQuestionNo - 1) / cubit.gameLength,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.secondaryColor,
                    ),
                    backgroundColor: AppColors.offWhite,
                    minHeight: 15,
                  ),
                ),

                // The question.
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    cubit.questions[cubit.currentQuestionIndx].question,
                    style: makeTextStyle(
                      textColor: Colors.black,
                      textSize: 22,
                      textWeight: .bold,
                    ),
                  ),
                ),

                // The question's answers.
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      cubit.selectedAnswerIndx = index;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: cubit.selectAnswerBorder(index: index),
                        color: AppColors.offWhite,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            cubit.selectedAnswerIndx == index
                                ? Icon(
                                    Icons.radio_button_on,
                                    color: AppColors.secondaryColor,
                                  )
                                : Icon(Icons.radio_button_off),
                            // cubit.selectAnswerRadio(index: index),
                            SizedBox(width: 10),
                            Text(
                              cubit
                                  .questions[cubit.currentQuestionIndx]
                                  .options[index],
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 20,
                                textWeight: .w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: 4, // # of possible answers.
                ),
                Spacer(),
                // Action button to move to the next question.
                InkWell(
                  onTap: () {
                    // Moving to the next quistion.
                    cubit.nextQuestion();

                    // IF the user reaches the end of the quiz.
                    if (cubit.state is FinishedQuizState) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            userScore: cubit.userGrade,
                            maximumScore: cubit.gameLength,
                          ),
                        ),
                      );
                    }
                  },
                  child: makeCustomButton(
                    buttonText: "Next",
                    textColor: AppColors.primaryColor,
                    buttonColor: AppColors.secondaryColor,
                    buttonIcon: Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    cubit.skipThisQuestion();

                    if (cubit.state is FinishedQuizState) {
                      // pop the question's screen and replace it with result one.
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            userScore: cubit.userGrade,
                            maximumScore: cubit.gameLength,
                          ),
                        ),
                      );
                    }
                  },
                  child: makeCustomButton(
                    buttonText: "Skip This Question",
                    textColor: Colors.black,
                    buttonColor: AppColors.offWhite,
                    buttonIcon: Icon(Icons.skip_next, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
