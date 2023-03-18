import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/note_controller.dart';
import 'package:timely/models/notemodel.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/views/update_note.dart';

class Notes extends StatelessWidget {
  Notes({Key? key}) : super(key: key);

  final NoteController _noteController =
      Get.put<NoteController>(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        // mini: true,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(RoutePaths.newNoteScreen);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(RoutePaths.homeScreen);
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Notes',
        ),
        actions: [
          Row(
            children: [
              const MenuButton(
                popupColor: Colors.white,
              ),
              Container(
                width: menuPadding,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
        elevation: 0,
      ),
      // body: FutureBuilder<QuerySnapshot>(
      //   future: _reference.get(),
      //   builder:(context, snapshot)  {
      //     if(snapshot.hasError){
      //       return Center(child: Text('Something went wrong'),);
      body: StreamBuilder<QuerySnapshot>(
        stream: _noteController.getSnapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data!;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            List<NotesModel> notes = documents
                .map((e) => NotesModel(
                    userID: e['userID'],
                    time: e['time'].toDate(),
                    title: e['title'],
                    body: e['body']))
                .toList();

            return _getBody(notes);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _getBody(List<NotesModel> notes) {
    return notes.isEmpty
        ? const Center(
            child: Text(
              'No notes Yet,\nClick "+" to start adding',
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Card(
              color: notes[index].body.length < 33
                  ? Colors.red.shade100
                  : notes[index].body.length < 65
                      ? Colors.yellow.shade100
                      : Colors.green.shade100,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateNote(note: notes[index]),
                      ));
                },
                title: Text(
                  notes[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('created at: ${notes[index].time.toString()}'),
                leading: CircleAvatar(
                  radius: 25,
                  child: Text(notes[index].body[0]),
                ),
                trailing: IconButton(
                    onPressed: () {
                      //
                      _noteController.deleteNote(notes[index]);
                      //
                    },
                    icon: Icon(
                      Icons.delete_forever_sharp,
                      color: Colors.black.withOpacity(0.75),
                    )),
              ),
            ),
          );
  }
}
