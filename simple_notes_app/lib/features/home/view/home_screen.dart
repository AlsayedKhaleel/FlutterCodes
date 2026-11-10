import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/core/helpers/app_colors.dart';
import 'package:simple_notes_app/core/helpers/constant_values.dart';
import 'package:simple_notes_app/core/widgets/alert_dialog.dart';
import 'package:simple_notes_app/core/widgets/app_bar.dart';
import 'package:simple_notes_app/core/widgets/floating_action_button.dart';
// import 'package:simple_notes_app/features/add_note/view/add_new_note.dart';
import 'package:simple_notes_app/features/edit_note/view/edit_note_screen.dart';
import 'package:simple_notes_app/features/home/cubit/home_cubit.dart';
import 'package:simple_notes_app/features/home/model/note_model.dart';

// class HomeScreen extends StatefulWidget {
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>()
      ..loadNotes(); // TODO: Take care of this friking line.

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: makeAppBar(
            barTitle: "Notes",
            barActions: [
              // Search Icon.
              makeFloatingActionBtn(btnOnTap: () {}, btnIcon: Icons.search),
              SizedBox(width: 10),

              // Information Icon.
              makeFloatingActionBtn(
                btnOnTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return makeAlertDialog(
                        showActions: false,
                        icon: Icons.info,
                        dialogTitle: "App Info",
                        dialogContent: INFO_MESSAGE,
                      );
                    },
                  );
                },
                btnIcon: Icons.info_outline,
              ),
              SizedBox(width: 10),
            ],
          ),

          body: cubit.noteModels.isEmpty
              ? Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      "$ASSET/no-notes.png",
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
                      // itemCount: noteModels.length,
                      itemCount: cubit.noteModels.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onLongPress: () {
                          cubit.selectNoteForDeletion(index);
                        },
                        onTap:
                            // disable more than one tap interfering.
                            cubit.selectedNoteIndx2Del != -1
                            ? null
                            : () async {
                                var callResult = await Get.to(
                                  () => EditNoteScreen(
                                    titleController: TextEditingController(
                                      text: cubit.noteModels[index].title,
                                    ),
                                    contentController: TextEditingController(
                                      text: cubit.noteModels[index].content,
                                    ),
                                  ),
                                );

                                cubit.editNote(index, callResult);
                              },
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    AppColors.notesColors[cubit
                                            .noteModels[index]
                                            .colorIndx ??
                                        0],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 30,
                                ),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  cubit.noteModels[index].title,
                                  style: TextStyle(
                                    fontWeight: .w400,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            if (index == cubit.selectedNoteIndx2Del)
                              GestureDetector(
                                onLongPress: () {
                                  cubit.discardNoteDeletion();
                                },
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return makeAlertDialog(
                                        icon: Icons.error_outline_outlined,
                                        dialogContent:
                                            "Are You Sure To Delete?",
                                        showActions: true,
                                        greenOnTap: () {
                                          cubit.discardNoteDeletion();
                                        },
                                        redOnTap: () {
                                          cubit.confirmNoteDeletion(index);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Stack(
                                  alignment: .center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.textDiscard,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 30,
                                          horizontal: 30,
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          cubit.noteModels[index].title,
                                          style: TextStyle(
                                            color: AppColors.textDiscard,
                                            fontWeight: .w400,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.delete,
                                      size: 40,
                                      color: AppColors.textPrimary,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          floatingActionButton: makeFloatingActionBtn(
            btnIcon: Icons.add,
            btnShape: CircleBorder(),
            btnOnTap: () async {
              // var result = await Get.to(() => AddNewNoteScreen());
              var result = await Get.to(
                () => EditNoteScreen(
                  titleController: TextEditingController(text: ""),
                  contentController: TextEditingController(text: ""),
                ),
              );

              cubit.addNewNote(result);
            },
          ),
        );
      },
    );
  }
}
