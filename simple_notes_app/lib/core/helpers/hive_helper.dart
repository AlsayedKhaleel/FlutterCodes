import 'package:hive_flutter/adapters.dart';

/// NotesApp local storage helper class.
class HiveHelper {
  static final String boxName = "notesBox";
  static final String notesKey = "notesKey";
  static List<dynamic> notesList = [];

  /// fetches the notes from the local storage in NotesApp.
  static void loadNotes() async {
    // It is now List<dynamic> or empty.
    notesList = (await Hive.box(boxName).get(notesKey)) ?? [];
  }

  /// Adds a note into the list.
  static void addNote({required String title, required String content, required int colorIndx}) async {
    // added to the in-memory list.
    notesList.add({
      "title": title,
      "content": content,
      "colorIndx": colorIndx,
    });
    // written on the disk for long-term storage.
    await Hive.box(boxName).put(notesKey, notesList);
  }

  /// Removes a specific note.
  static void deleteNote(int noteIndx) async {
    notesList.removeAt(noteIndx);
    await Hive.box(boxName).put(notesKey, notesList);
  }

  static void storeNotes() async {
    await Hive.box(boxName).put(notesKey, notesList);
  }
}
