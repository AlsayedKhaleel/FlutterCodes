import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:meta/meta.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';
import 'package:simple_notes_app/core/helpers/hive_helper.dart';
import 'package:simple_notes_app/features/home/model/note_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<NoteModel> noteModels = [];
  int selectedNoteIndx2Del = -1;

  // Load the notes from the local database.
  void loadNotes() {
    noteModels = HiveHelper.notesList
        .map((e) => NoteModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
    if (noteModels.isEmpty) {
      emit(NotesBoxEmptyState());
    } else {
      emit(NotesLoadedSuccessfulyState());
    }
  }

  // If the user wants to delete a note.
  void selectNoteForDeletion(int index) {
    selectedNoteIndx2Del = index;
    emit(NoteSelectedToDeleteState());
  }

  // The user changed his mind.
  void discardNoteDeletion() {
    selectedNoteIndx2Del = -1;
    Get.back();
    emit(NoteDiscardDeletionState());
  }

  // The user is insesting to delete.
  void confirmNoteDeletion(int index) {
    HiveHelper.deleteNote(index);
    noteModels.removeAt(index);
    selectedNoteIndx2Del = -1;
    Get.back();
    emit(NoteConfirmDeletionState());
    if (noteModels.isEmpty) {
      emit(NotesBoxEmptyState());
    }
  }

  // The user added a new note.
  void addNewNote(NoteModel? note) {
    if (note != null) {
      note.colorIndx =
          HiveHelper.notesList.length % AppColors.notesColors.length;
      noteModels.add(note);
      HiveHelper.addNote(
        title: note.title,
        content: note.content,
        colorIndx: note.colorIndx ?? 0,
      );
      emit(NoteAddedSuccessfulyState());
    } else {
      emit(NoteDiscardAdditionState());
    }
  }

  void editNote(int index, dynamic updatedNote) {
    // I used dynamic here instead of NoteModel, to maintain the orignal note's color.
    // noteModels[index] = updatedNote;
    if (updatedNote != null) {
      NoteModel tempNote = updatedNote as NoteModel;
      // Save changes in the cubit's list.
      noteModels[index].title = tempNote.title;
      noteModels[index].content = tempNote.content;

      // Save them in the HiveHelper list.
      HiveHelper.notesList[index]["title"] = tempNote.title;
      HiveHelper.notesList[index]["content"] = tempNote.content;

      // write them on the local storage.
      HiveHelper.storeNotes();
      emit(NoteEditedState());
    } else {
      emit(NoteDiscardModState());
    }
  }
}
