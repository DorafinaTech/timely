import 'dart:developer';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/controllers/loading_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import '../models/notemodel.dart';
import 'package:timely/controllers/note_controller.dart';

class UpdateNote extends StatelessWidget {
  late final NotesModel note;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  final LoadingControler _lodingController =
      Get.put<LoadingControler>(LoadingControler());

  final NoteController _noteController = NoteController();

  final _formKey = GlobalKey<FormState>();

  UpdateNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    bodyController.text = note.body;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit note'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                getMyField(
                    focusNode: focusNode,
                    hintText: 'title',
                    textInputType: TextInputType.number,
                    controller: titleController),
                // getMyField(hintText: 'time', controller: timeController),
                getMyField(
                    hintText: 'body',
                    textInputType: TextInputType.number,
                    controller: bodyController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _lodingController.startLoading();

                            try {
                              NotesModel updatedNote = NotesModel(
                                  userID:
                                      _authController.currentUser.value!.uid,
                                  time: DateTime.now(),
                                  title: titleController.text,
                                  body: bodyController.text);

                              final collectionReference = FirebaseFirestore
                                  .instance
                                  .collection(_noteController.collectionName);

                              FirebaseFirestore.instance
                                  .collection(_noteController.collectionName)
                                  .where('userID',
                                      isEqualTo: _authController
                                          .currentUser.value!.uid)
                                  .where('title', isEqualTo: note.title)
                                  .get()
                                  .then((snapshot) {
                                var ref = snapshot.docs[0].id;

                                collectionReference
                                    .doc(ref)
                                    .update(updatedNote.toJson())
                                    .whenComplete(() {
                                  log('Note Updated');

                                  _lodingController.stopLoading();

                                  if (Navigator.canPop(Get.context!)) {
                                    Navigator.pop(Get.context!);
                                  } else {
                                    Get.toNamed(RoutePaths.notescreen);
                                  }
                                }).onError((error, stackTrace) {
                                  _lodingController.stopLoading();
                                  showErrorSnackbar(
                                      'Could not update note :-(');
                                  debugPrint(error.toString());
                                });

                                //
                              });
                            } catch (e) {
                              _lodingController.stopLoading();
                              showErrorSnackbar('Could not update note :-(');
                              debugPrint(e.toString());
                            }
                          }
                        },
                        child: const Text('Update')),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget getMyField(
      {required String hintText,
      TextInputType textInputType = TextInputType.name,
      required TextEditingController controller,
      FocusNode? focusNode}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        focusNode: focusNode,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: 'Write $hintText',
            labelText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    );
  }
}
