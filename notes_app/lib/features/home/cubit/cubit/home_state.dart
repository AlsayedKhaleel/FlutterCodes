part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// if there is no note in the local storage.
final class EmptyNotesState extends HomeState {}

// if the notes are loaded successfuly.
final class NotesLoadedState extends HomeState {}

final class AddNewNoteState extends HomeState {}

final class DeleteNoteState extends HomeState {}


