import 'package:flutter/services.dart';
import 'app_colors.dart';

class NoteModel {
  static int notesNumber = 0;

  String noteContent = "";
  Color noteColor = notesColors[0];
  int noteNum = 0;

  NoteModel({required this.noteColor, required this.noteContent}) {
    noteNum = ++notesNumber;
  }
}