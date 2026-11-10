part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// When the notes were loaded sucessfuly.
final class NotesLoadedSuccessfulyState extends HomeState {}

// When the user deleted a note successfuly.
final class NoteDeletedState extends HomeState {}

// When the user changed his mind to keep the note.
final class NoteDiscardDeletionState extends HomeState {}

// If the user decided to delete the note.
final class NoteConfirmDeletionState extends HomeState {}

// If the local storage has no notes to load.
final class NotesBoxEmptyState extends HomeState {}

// If the user choosed a note to delete.
final class NoteSelectedToDeleteState extends HomeState {}

// IF the user added a new note.
final class NoteAddedSuccessfulyState extends HomeState {}

// If the user changed his mind to add a new note.
final class NoteDiscardAdditionState extends HomeState {}

// The user edited a note.
final class NoteEditedState extends HomeState {}

// When the user changed his mind to keep the note.
final class NoteDiscardModState extends HomeState {}