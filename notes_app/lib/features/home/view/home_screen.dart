import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helpers/app_colors.dart';
import 'package:notes_app/core/helpers/hive_helper.dart';
import 'package:notes_app/core/widgets/app_bar.dart';
import 'package:notes_app/core/widgets/alert_dialog.dart';
import 'package:notes_app/core/widgets/dialog_buttons.dart';
import 'package:notes_app/core/widgets/floating_action_button.dart';
import 'package:notes_app/features/add_note/view/add_new_note.dart';
import 'package:notes_app/core/helpers/constant_values.dart';
import 'package:notes_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:notes_app/features/home/model/note_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>()..loadNotes();
    // cubit.loadNotes();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: makeAppBar(
            barTitle: "Notes",
            barActions: [
              makeFloatingActionBtn(btnOnTap: () {}, btnIcon: Icons.search),
              SizedBox(width: 10),

              makeFloatingActionBtn(
                btnOnTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return makeAlertDialog(
                        icon: Icons.info,
                        dialogTitle: "App Info",
                        dialogContent:
                            ("Developed by Alsayed Khaleel.\n"
                            "© 2026 Mavericks Ltd. All rights reserved.\n"
                            "Built using modern design principles for a seamless user experience."),
                      );
                    },
                  );
                },
                btnIcon: Icons.info_outline,
              ),
              SizedBox(width: 10),
            ],
          ),

          body: cubit.notesModelList == null || cubit.notesModelList!.isEmpty
              ? Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      "assets/images/no-notes.png",
                      width: double.infinity,
                      fit: .fill,
                    ),
                    Text(
                      "Create Your First Note!",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 30,
                        fontWeight: .w400,
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.notesModelList!.length,
                      itemBuilder: (context, index) => InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return makeAlertDialog(
                                icon: Icons.info,
                                dialogContent:
                                    "Are You Sure To Delete This Note?",
                                dialogActions: [
                                  makeDialogButton(
                                    "Discard",
                                    AppColors.textDiscard,
                                    () {
                                      cubit.deleteNote(index);
                                      Get.back();
                                    },
                                  ),
                                  makeDialogButton(
                                    "  Keep  ",
                                    AppColors.textConfirm,
                                    () => Get.back(),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onTap: () {
                          print("============================");
                          print("Open this note to edit.");
                          print("============================");
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                AppColors.notesColors[cubit
                                    .notesModelList![index]
                                    .colorIndx],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 30,
                            ),
                            child: Text(
                              textAlign: TextAlign.left,
                              cubit.notesModelList![index].title,
                              style: TextStyle(fontWeight: .w400, fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          floatingActionButton: makeFloatingActionBtn(
            btnIcon: Icons.add,
            btnShape: CircleBorder(),
            btnOnTap: () async {
              await Get.to(() => AddNewNoteScreen());
              cubit.addNewNote();
              cubit.loadNotes();
            },
          ),
        );
      },
    );
  }
}
