import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'hive_store.dart';
import 'note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: Color(0xFF252525),
        title: Text(
          "Notes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 43,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFF3B3B3B),
            child: Icon(Icons.search, color: Colors.white),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            // information icon.
            onPressed: () {
              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                backgroundColor: Color(0xFF252525),
                content: Text(
                  APP_INFO,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: .w400,
                  ),
                ),
              );

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
            backgroundColor: Color(0xFF3B3B3B),
            child: Icon(Icons.info_outline, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: makeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF252525),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {
          addNoteController.clear(); // clear the old content each time.

          // build the 'ok' button to add a note.
          Widget okButton = TextButton(
            // set up the button
            child: Text("OK", style: TextStyle(color: Colors.white)),
            onPressed: () {
              // put the add logic here.
              LocalStrore.addNote(
                NoteModel(
                  noteColor:
                      notesColors[LocalStrore.notes.length %
                          notesColors.length],
                  noteContent: addNoteController.text,
                ),
              );
              setState(() {
                Navigator.pop(context);
              });
            },
          );

          // build the 'Cancel' button to discard adding a note.
          Widget cancelButton = TextButton(
            child: Text("Cancel", style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            backgroundColor: screenBackgroundColor,
            // backgroundColor: Colors.black,
            title: Text("Write Note", style: TextStyle(color: Colors.white)),
            content: TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              controller: addNoteController,
            ),
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
        child: Icon(Icons.add, size: 40),
      ),
    );
  }

  // constructs a widget from the object NoteModel 'note'.
  Widget buildNote(NoteModel note) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: note.noteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            note.noteContent,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }

  // builds the screen's body.
  Widget makeBody() {
    if (LocalStrore.notes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.asset("assets/no-notes.png"),
            Text(
              "Create your first note!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: .w300,
              ),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: LocalStrore.notes.length,
                itemBuilder: (c, i) => InkWell(
                  onLongPress: () {
                    LocalStrore.deleteNote(i);
                    setState(() {});
                  },
                  child: buildNote(LocalStrore.notes[i]),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
