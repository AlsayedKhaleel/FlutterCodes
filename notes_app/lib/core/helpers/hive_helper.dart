import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/helpers/app_colors.dart';

/// NotesApp local storage helper class.
class HiveHelper {
  static final String boxName = "notesBox";
  static int notesKey = 0;
  static var notesList = [];

  /// fetches the notes from the local storage in NotesApp.
  static void loadNotes() async {
    notesList =
        (await Hive.box(boxName).get(notesKey)) ??
        []; // returns the List<dynamic> nots back from local storage.

    notesList = notesList
        .map((item) => Map<String, dynamic>.from(item))
        .toList(); // converting the raw List<dynamic> into List<Map<String, dynamic>>.
  }

  /// Adds a note into the list.
  static void addNote({required String title, required String content}) async {
    notesList.add({
      "title": title,
      "content": content,
      "colorIndx": notesList.length % AppColors.notesColors.length,
    });
    // try {
    await Hive.box(boxName).put(HiveHelper.notesKey, notesList);

    // } catch (e) {
    //   print(e.)
    // }
  }

  /// Removes a specific note.
  static void deleteNote(int noteIndx) async {
    notesList.removeAt(noteIndx);
    await Hive.box(boxName).put(HiveHelper.notesKey, notesList);
  }
}
