import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_notes_app/core/helpers/hive_helper.dart';
import 'package:simple_notes_app/features/home/cubit/home_cubit.dart';
import 'package:simple_notes_app/features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive

  await Hive.openBox("notesBox");
  // await Hive.box("notesBox").deleteFromDisk();

  HiveHelper.loadNotes(); // load the notes from local storage into its own list of maps.

  runApp(DevicePreview(builder: (context) => NotesApp()));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocProvider(create: (context) => HomeCubit(), child: HomeScreen()),
    );
  }
}
