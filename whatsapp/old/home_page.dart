import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'hive_store.dart';
import 'main.dart';
import 'note_model.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  TextEditingController? addNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: _makeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: LocalStrore.notes.length,
                itemBuilder: (c, i) => InkWell(
                  onLongPress: () {
                    notesList.removeAt(i);
                    setState(() {});
                  },
                  child: _buildNote(LocalStrore.notes[i]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: screenBackgroundColor,
        foregroundColor: Colors.white,
        onPressed: () {
          addNoteController?.clear();

          Widget okButton = TextButton(
            // set up the button
            child: Text("OK"),
            onPressed: () {
              notesList.add(
                NoteModel(
                  noteColor:
                      notesColors[LocalStrore.notes.length % notesColors.length],
                  noteContent: addNoteController!.text,
                ),
              );

              setState(() {});
              Navigator.pop(context);
            },
          );

          Widget cancelButton = TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Write Note"),
            content: TextField(controller: addNoteController),
            actions: [cancelButton, okButton],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // build the appbar widget.
  AppBar _makeAppBar() {
    return AppBar(
      backgroundColor: screenBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          "Notes",
          style: TextStyle(
            fontWeight: .w500,
            fontSize: 44,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        _makeActionIcon(Icons.search),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              Widget okButton = TextButton(
                // set up the button
                child: Text("OK"),
                onPressed: () {
                  notesList.clear();
                  setState(() {});
                  Navigator.pop(context);
                },
              );

              Widget cancelButton = TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text(
                  "Warnning!!!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: .bold,
                  ),
                ),
                content: Text("ClEAR ALL NOTES?"),
                actions: [cancelButton, okButton],
              );

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
            child: _makeActionIcon(Icons.delete),
          ),
        ),
      ],
    );
  }

  // build the two buttons (actions) on the app bar.
  Widget _makeActionIcon(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: actionIconsColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  // build the widet from the 'note' object.
  Widget _buildNote(NoteModel note) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: note.noteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            note.noteContent,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
