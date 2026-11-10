import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/helpers/app_colors.dart';
import 'package:notes_app/core/helpers/hive_helper.dart';
import 'package:notes_app/features/add_note/view/add_new_note.dart';
import 'package:notes_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:notes_app/features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive

  // Hive.deleteBoxFromDisk(HiveHelper.boxName);
  await Hive.openBox(HiveHelper.boxName);

  // HiveHelper.addNote(title: "Title2", content: "Content2");
  HiveHelper.addNote(title: "Title3", content: "Content3");
  // HiveHelper.addNote(title: "Title4", content: "Content4");
  print("===========================");
  print(HiveHelper.notesList);
  print("===========================");
  // runApp(NotesApp());

  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Linux Operating System is the biggest open source and for free family of operating systems...........", content: "Content1");
  // HiveHelper.addNote(title: "Title5", content: "Content5");
  // HiveHelper.addNote(title: "Title6", content: "Content6");
  // Hive.box(HiveHelper.boxName).clear();
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: GetMaterialApp(home: HomeScreen()),
    );
  }
}
