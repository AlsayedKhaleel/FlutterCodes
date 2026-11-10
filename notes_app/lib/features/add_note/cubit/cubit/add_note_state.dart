part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

// note added successfuly.
final class NoteAddedState extends AddNoteState {}
