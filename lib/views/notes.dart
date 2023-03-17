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
   final CollectionReference _reference = FirebaseFirestore .instance.collection('notes');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        mini: true,
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
      body: FutureBuilder<QuerySnapshot>(
        future: _reference.get(),
        builder:(context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Something went wrong'),);
          }
          if(snapshot.hasData){
            QuerySnapshot querySnapshot = snapshot.data! ;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            List <NotesModel> notes = documents.map((e) => NotesModel(
                userID: e['userID'],
                time: e['time'],
                title: e['title'],
                body: e['body'])).toList();
            return _getBody(notes as NotesModel);
          }
        },
      ),
    );
  }

   Widget _getBody(notes) {
     return notes.isEmpty
         ? const Center(
       child: Text(
         'No Student Yet\nClick + to start adding',
         textAlign: TextAlign.center,
       ),
     )
         : ListView.builder(
       itemCount: notes.length,
       itemBuilder: (context, index) => Card(
         color: notes[index].marks < 33
             ? Colors.red.shade100
             : notes[index].marks < 65
             ? Colors.yellow.shade100
             : Colors.green.shade100,
         child: ListTile(
           title: Text(notes[index].name),
           subtitle: Text('Rollno: ${notes[index].rollno}'),
           leading: CircleAvatar(
             radius: 25,
             child: Text('${notes[index].marks}'),
           ),
           trailing: SizedBox(
             width: 60,
             child: Row(
               children: [
                 InkWell(
                   child: Icon(
                     Icons.edit,
                     color: Colors.black.withOpacity(0.75),
                   ),
                   onTap: () {
                     //
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) =>
                               UpdateNote(note: notes[index]),
                         ));
                     //
                   },
                 ),
/*
                 InkWell(
                   child: const Icon(Icons.delete),
                   onTap: () {
                     //
                     _reference.doc(notes[index].id).delete();
                     // To refresh
                     Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(
                           builder: (context) => HomePage(),
                         ));

                     //
                   },
                 ),
*/
               ],
             ),
           ),
         ),
       ),
     );
   }
}

