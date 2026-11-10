import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'empty_home_screen.dart';
import 'hive_store.dart';
import 'note_model.dart';

List<NoteModel> notesList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  var box1 = await Hive.openBox(LocalStrore.boxName);

  // the notes & their colors now are stored in the 'LocalStore.notes' list.
  LocalStrore.getStoredNotes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
