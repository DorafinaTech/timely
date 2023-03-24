import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/controllers/note_controller.dart';

class NewNoteScreen extends StatelessWidget {
  final NoteController _noteController =
      Get.put<NoteController>(NoteController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () => Get.toNamed(RoutePaths.notescreen),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          maxLines: null,
                          autofocus: true,
                          controller: titleController,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Type something...",
                          ),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            showEmptyTitleDialog(context);
          } else {
            addNewNote(titleController.text.trim(), bodyController.text.trim());

            Navigator.pop(context);
          }
        },
        label: const Text("Save"),
        icon: const Icon(Icons.save),
      ),
    );
  }

  void addNewNote(String title, String body) {
    _noteController.addNewNote(title, body);
  }
}

void showEmptyTitleDialog(BuildContext context) {
  debugPrint("in dialog ");

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Get.theme.colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: Text(
          "Notes is empty!",
          style: Get.theme.textTheme.titleLarge,
        ),
        content: Text(
          'The content of the note cannot be empty.',
          style: Get.theme.textTheme.titleMedium,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Get.theme.textTheme.titleMedium,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
