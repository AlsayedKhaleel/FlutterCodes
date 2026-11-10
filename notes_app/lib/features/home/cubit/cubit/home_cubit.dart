import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/helpers/hive_helper.dart';
import 'package:notes_app/features/home/model/note_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<NoteModel>? notesModelList;

  void loadNotes() {
    HiveHelper.loadNotes();

    if (HiveHelper.notesList.isEmpty) {
      emit(EmptyNotesState());
    } else {
      emit(NotesLoadedState());
      notesModelList = HiveHelper.notesList
          .map((element) => NoteModel.fromMap(element))
          .toList();
    }
  }

  void deleteNote(int index) {
    emit(DeleteNoteState());
    HiveHelper.deleteNote(index);
  }

  void addNewNote() {
    emit(AddNewNoteState());
  }
}


/*

makeFloatingActionBtn(
            btnIcon: Icons.add,
            btnShape: CircleBorder(),
            btnOnTap: () {
              Get.off(() => cubit.addNewNote());
              // print("====================================================");
              // print("Routing To AddNewNoteScreenScreen");
              // print("====================================================");
            },

  void addNewNote() {
    Get.off(AddNewNoteScreen());
    emit(AddNewNoteState());
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => AddNewNoteScreen()),
    // );
  }


*/