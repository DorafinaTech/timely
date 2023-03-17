import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timely/views/notes.dart';


class UpdateNote extends StatelessWidget {
  late final Note note;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  UpdateNote({super.key, required this. note});{
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = '{note.title}';
    timeController.text = '{note.time}';
    bodyController.text = '{note.body}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            getMyField(
                focusNode: focusNode,
                hintText: 'title',
                textInputType: TextInputType.number,
                controller: titleController),
            getMyField(hintText: 'time', controller: timeController),
            getMyField(
                hintText: 'body',
                textInputType: TextInputType.number,
                controller: bodyController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      // ToDO: Update a note
                      Notes updatedNote = note;
                      //
                      final collectionReference =
                      FirebaseFirestore.instance.collection('note');
                      collectionReference
                          .doc(updatedNote as String?)
                          .update(updatedNote as Map<Object, Object?>)
                          .whenComplete(() {
                        log('Note Updated');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notes(),
                            ));
                      });
                      //
                    },
                    child: const Text('Update')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    onPressed: () {
                      //
                      titleController.text = '';
                      timeController.text = '';
                      bodyController.text = '';
                      focusNode.requestFocus();
                      //
                    },
                    child: const Text('Corrected')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getMyField(
      {required String hintText,
        TextInputType textInputType = TextInputType.name,
        required TextEditingController controller,
        FocusNode? focusNode}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
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
