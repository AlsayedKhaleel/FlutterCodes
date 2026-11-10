import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';
import 'package:simple_notes_app/core/widgets/alert_dialog.dart';
import 'package:simple_notes_app/core/widgets/app_bar.dart';
import 'package:simple_notes_app/core/widgets/floating_action_button.dart';
import 'package:simple_notes_app/core/widgets/text_form_field.dart';
import 'package:simple_notes_app/features/home/model/note_model.dart';

class EditNoteScreen extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const EditNoteScreen({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    // our reference note.
    NoteModel oldNote = NoteModel(
      title: titleController.text,
      content: contentController.text,
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: makeAppBar(
        barLeading: makeFloatingActionBtn(
          btnIcon: Icons.arrow_back_ios_new,
          btnOnTap: () {
            // IF we got changes and the user pressed the back arrow.
            if (titleController.text != oldNote.title ||
                contentController.text != oldNote.content) {
              showDialog(
                context: context,
                builder: (context) => makeAlertDialog(
                  icon: Icons.error_outline_outlined,
                  dialogContent: "Discard Changes?",
                  showActions: true,
                  greenOnTap: () {
                    Get.back();
                    Get.back(
                      result: NoteModel(
                        title: titleController.text,
                        content: contentController.text,
                      ),
                    );
                  },
                  // discard those changes.
                  redOnTap: () {
                    Get.back(); // pop the alert dialog.
                    Get.back(); // pop the edit screen.
                  },
                ),
              );
            } else {
              Get.back(); // if we didn't make any change.
            }
          },
        ),
        barActions: [
          // eye button to discard the note being edited.
          makeFloatingActionBtn(
            btnIcon: Icons.remove_red_eye_outlined,
            btnOnTap: () {
              // The user made changes on the note.
              if (titleController.text != oldNote.title ||
                  contentController.text != oldNote.content) {
                showDialog(
                  context: context,
                  builder: (context) => makeAlertDialog(
                    icon: Icons.error_outline_outlined,
                    dialogContent: "Discard Changes?",
                    showActions: true,
                    greenOnTap: () {
                      // save those changes.
                      Get.back();
                      Get.back(
                        result: NoteModel(
                          title: titleController.text,
                          content: contentController.text,
                        ),
                      );
                    },
                    redOnTap: () {
                      // pops off the alert dialog & the edit screen.
                      Get.back();
                      Get.back();
                    },
                  ),
                );
              } else {
                Get.back(); // pops the edit screen.
              }
            },
          ),
          SizedBox(width: 10),

          makeFloatingActionBtn(
            btnIcon: Icons.save_outlined,
            btnOnTap: () {
              // The user made changes on the note.
              if (titleController.text != oldNote.title ||
                  contentController.text != oldNote.content) {
                showDialog(
                  context: context,
                  builder: (context) => makeAlertDialog(
                    icon: Icons.error_outline_outlined,
                    dialogContent: "Save Changes?",
                    showActions: true,
                    greenOnTap: () {
                      Get.back();
                      Get.back(
                        result: NoteModel(
                          title: titleController.text,
                          content: contentController.text,
                        ),
                      );
                    },
                    redOnTap: () {
                      Get.back();
                      Get.back();
                    },
                  ),
                );
              } else {
                Get.back(); // pops off the alert dialog.
              }
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          makeTextFormField(
            fieldController: titleController,
            fieldFontSize: 40,
            fieldHintText: "Title",
          ),
          makeTextFormField(
            fieldController: contentController,
            fieldFontSize: 23,
            fieldHintText: "Type something...",
          ),
        ],
      ),
    );
  }
}
