import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/helpers/app_colors.dart';
import 'package:quiz_game/core/helpers/hive_helper.dart';
import 'package:quiz_game/core/helpers/responsive.dart';
import 'package:quiz_game/core/helpers/text_style_helper.dart';
import 'package:quiz_game/core/widgets/app_bar.dart';
import 'package:quiz_game/core/widgets/custom_button.dart';
import 'package:quiz_game/features/home/view/home_screen.dart';
import 'package:quiz_game/features/question/cubit/cubit/question_cubit.dart';
import 'package:quiz_game/features/question/view/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  int userScore;
  int maximumScore;

  ResultScreen({
    super.key,
    required this.userScore,
    required this.maximumScore,
  }) {
    QuizHive.storeScore(userScore); // store user's current score.
  }

  @override
  Widget build(BuildContext context) {
    
    final COMPONENT_PERC = 1 / 6 * ResponsiveClass.getScreenHeight(context);

    return Scaffold(
      backgroundColor: Color(0xFFF0F4F8),
      appBar: makeAppBar(
        barBackgroundColor: Color(0xFFF0F4F8),
        barTitle: Text(
          "Quiz Results",
          style: makeTextStyle(
            textColor: Colors.black,
            textSize: 20,
            textWeight: .bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveClass.getScreenWidth(context) * 0.02,
          
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 158, 203, 255),
              radius: 60,
              child: Icon(
                Icons.stars_rounded,
                color: AppColors.secondaryColor,
                size: 70,
              ),
            ),

            Column(
              children: [
                Text(
                  userScore >= (maximumScore * 7 / 10)
                      ? "Congratulations!"
                      : "GAME OVER",
                  style: makeTextStyle(
                    textColor: Colors.black,
                    textSize: 25,
                    textWeight: .w600,
                  ),
                ),
                Text(
                  userScore >= (maximumScore * 7 / 10)
                      ? "You've mastered this quiz!"
                      : "Let's Do it again, to master!",
                  style: makeTextStyle(
                    textColor: Colors.black,
                    textSize: 16,
                    textWeight: .w400,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: COMPONENT_PERC,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.stars, color: AppColors.secondaryColor),
                            Text(
                              "  Your Score",
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 18,
                                textWeight: .w400,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "$userScore",
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 40,
                                textWeight: .bold,
                              ),
                            ),
                            Text(
                              " /$maximumScore",
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 20,
                                textWeight: .w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: COMPONENT_PERC,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.track_changes,
                              color: AppColors.secondaryColor,
                            ),
                            Text(
                              "  Accuracy",
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 18,
                                textWeight: .w400,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "${((userScore / maximumScore) * 100).toInt()}%",
                              style: makeTextStyle(
                                textColor: Colors.lightBlue,
                                textSize: 20,
                                textWeight: .bold,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LinearProgressIndicator(
                            borderRadius: .circular(20),
                            value: userScore / maximumScore,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.secondaryColor,
                            ),
                            backgroundColor: Color(0xFFF0F4F8),
                            minHeight: 15,
                          ),
                        ),

                        Row(
                          children: [
                            userScore >= (maximumScore * 7 / 10)
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.cancel, color: Colors.red),

                            Text(
                              userScore >= (maximumScore * 7 / 10)
                                  ? "  Great Job you're almost perfect!"
                                  : "  You're far away, try again.",
                              style: makeTextStyle(
                                textColor: Colors.black,
                                textSize: 16,
                                textWeight: .w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _makeTimeRankBox(
                        label: "TIME SPENT",
                        value: "4m55s",
                        boxHeight: COMPONENT_PERC * 0.8,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _makeTimeRankBox(
                        label: "RANK",
                        value:
                            "#${QuizHive.getGameRank(userScore)}/${QuizHive.getGamesCount()}",
                        boxHeight: COMPONENT_PERC * 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Spacer(),
            // Replay the quesitons.
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => QuestionCubit(),
                          child: const QuestionsScreen(),
                        ),
                      ),
                    );
                  },
                  child: makeCustomButton(
                    buttonText: "Play Again",
                    textColor: AppColors.primaryColor,
                    buttonColor: Colors.lightBlue,
                    buttonIcon: Icon(
                      Icons.refresh,
                      color: AppColors.primaryColor,
                    ),
                    isPrefixIcon: true,
                  ),
                ),
                SizedBox(height: 15),
                // Back to the home page of the app.
                InkWell(
                  onTap: () {
                    // remvoes the whole screens untill the HomeScreen.
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) =>
                          false, // This removes all previous routes
                    );
                  },
                  child: makeCustomButton(
                    buttonText: "Back To Home",
                    textColor: Colors.black,
                    buttonColor: AppColors.primaryColor,
                    buttonIcon: Icon(Icons.home, color: Colors.black),
                    isPrefixIcon: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // This is to construct the two boxes of the duration time & the score rank.
  Widget _makeTimeRankBox({
    required String label,
    required String value,
    required double boxHeight,
  }) {
    return Container(
      height: boxHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: .circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(
              label,
              style: makeTextStyle(
                textColor: Colors.blueGrey,
                textSize: 20,
                textWeight: .w600,
              ),
            ),
            Text(
              value,
              style: makeTextStyle(
                textSize: 25,
                textColor: Colors.black,
                textWeight: .bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
