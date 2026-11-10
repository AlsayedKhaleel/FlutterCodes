import 'package:hive_flutter/hive_flutter.dart';
import 'note_model.dart';

class LocalStrore {
  static const boxName = "box1";
  static List<NoteModel> notes = [];

  // return back the notes store in the database, and build a list of objects 'notes'.
  static void getStoredNotes()
  {
    print("=============");
    print(Hive.box(boxName).values);

    // read the notes back from the box & fill in the notes[].
    // for (var note in Hive.box(boxName).values) {
    //   notes.add(
    //     NoteModel(
    //       noteContent: note,
    //       noteColor: notesColors[notes.length % notesColors.length],
    //     ),
    //   );
    // }

  }

  // Add a note to both the local database & the list of instances.
  static void addNote(NoteModel note) {
    notes.add(note);
    Hive.box(boxName).put("box1", notes);
  }

  // Delete a note from both the local database & the list of instances.
  static void deleteNote(int noteIndex)
  {
    notes.removeAt(noteIndex);
    Hive.box(boxName).put("box1", notes);
  }
}
