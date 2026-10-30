part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

// if the hitted the 'skip question' button
final class QuestionSkipedState extends QuestionState {}

// if the user hitted the 'next' button without selecting a choice.
final class QuestionNotAnsweredState extends QuestionState {}

// the user selected a choice and hitted 'next' button.
final class QuestionAnsweredState extends QuestionState {}

// the user choosed an answer.
final class ChoosedAnswerState extends QuestionState {}

// the user finished the quiz.
final class FinishedQuizState extends QuestionState {}
