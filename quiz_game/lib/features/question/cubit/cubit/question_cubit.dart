import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/core/constants/questions.dart';
import 'package:quiz_game/features/question/model/qeustion_model.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  // game length, 75% of the given questions.
  int gameLength = (3 / 4 * quizQuestions.length.toDouble()).toInt();
  int selectedAnswerIndx = -1;
  int currentQuestionNo = 1; // the number of the question being answered.
  int userGrade = 0; // the grade achived by the user.
  int currentQuestionIndx = Random().nextInt(
    quizQuestions.length,
  ); // generate a question's random index.

  // load the question (in text form) into a list models for each handling.
  List<QeustionModel> questions =
      quizQuestions.map((e) => QeustionModel.fromJson(e)).toList()..shuffle();

  /// if the user pressed 'Next->' button
  ///   he either pressed it with a selected answer
  ///   or there is no answer has been selected.
  void nextQuestion() {
    // user didn't select a choice.
    if (selectedAnswerIndx == -1) {
      Get.snackbar(
        "Oops!",
        "Please select an answer or skip this question.",
        backgroundColor: Colors.red,
      );
      emit(QuestionNotAnsweredState());

      // he did select one.
    } else if (selectedAnswerIndx != -1) {
      // if the user selected the right answer, increase his score.
      if (questions[currentQuestionIndx].options[selectedAnswerIndx] ==
          questions[currentQuestionIndx].answer) {
        userGrade++;
      }

      // move to the next question, and reset the indexes.
      currentQuestionNo++;
      currentQuestionIndx = Random().nextInt(questions.length);
      selectedAnswerIndx = -1;

      // if the user reached the end of the game.
      if ((currentQuestionNo - 1) >= gameLength) {
        emit(FinishedQuizState());
      } else {
        emit(ChoosedAnswerState());
      }
    }
  }

  // if the user clicked on one of the possible answers.
  BoxBorder? selectAnswerBorder({required int index}) {
    emit(ChoosedAnswerState());
    return selectedAnswerIndx == index
        ? BoxBorder.all(color: Colors.blue, width: 3)
        : null;
  }

  ///If the user skipped this question.
  void skipThisQuestion() {
    emit(QuestionSkipedState());
    currentQuestionNo++;
    currentQuestionIndx = Random().nextInt(questions.length);
    selectedAnswerIndx = -1;

    // if the user reached the end of the questions.
    if ((currentQuestionNo - 1) >= gameLength) {
      emit(FinishedQuizState());
    }
  }
}
