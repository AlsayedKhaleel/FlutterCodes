import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helpers/app_colors.dart';
import 'package:notes_app/core/helpers/hive_helper.dart';
import 'package:notes_app/core/widgets/alert_dialog.dart';
import 'package:notes_app/core/widgets/dialog_buttons.dart';
import 'package:notes_app/core/widgets/floating_action_button.dart';
import 'package:notes_app/core/widgets/text_form_field.dart';
import 'package:notes_app/core/widgets/app_bar.dart';
import 'package:notes_app/features/home/model/note_model.dart';
import 'package:notes_app/features/home/view/home_screen.dart';

class AddNewNoteScreen extends StatelessWidget {
  AddNewNoteScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: makeAppBar(
        barLeading: FloatingActionButton(
          backgroundColor: AppColors.secondaryColor,
          onPressed: () => Get.back(result: null),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: 30,
            fontWeight: .w200,
          ),
        ),
        barActions: [
          makeFloatingActionBtn(
            btnOnTap: () {
              Get.back(result: null);
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {

              // return makeAlertDialog(
              //   icon: Icons.info,
              //   dialogContent: "Are You Sure To Delete This Note?",
              //   dialogActions: [
              //     makeDialogButton(
              //       "Discard",
              //       AppColors.textDiscard,
              //       () {},
              //       // Get.off(HomeScreen()),
              //     ),
              //     makeDialogButton(
              //       "  Keep  ",
              //       AppColors.textConfirm,
              //       () => Get.back(),
              //     ),
              //   ],
              // );

              //   },
              // );
            },

            btnIcon: Icons.remove_red_eye_outlined,
          ),

          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              HiveHelper.addNote(
                title: titleController.text,
                content: contentController.text,
              );
              Get.back();
            },
            backgroundColor: AppColors.secondaryColor,
            child: Icon(
              Icons.save_outlined,
              color: AppColors.textPrimary,
              size: 30,
              fontWeight: .w200,
            ),
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
            // initialValue: initialContent,
            fieldController: contentController,
            fieldFontSize: 23,
            fieldHintText: "Type something...",
          ),
        ],
      ),
    );
  }
}
