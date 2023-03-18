import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/note_controller.dart';

class NewNoteScreen extends StatelessWidget {
  final NoteController _noteController =
      Get.put<NoteController>(NoteController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
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
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty && bodyController.text.isEmpty) {
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









// import 'package:flutter/material.dart';
// import 'package:timely/controllers/note_controller.dart';
// import 'package:get/get.dart';
//
// import '../components/bottom_navigation.dart';
// import '../constants/menu_padding.dart';
// import 'notes.dart';

// class NewNoteScreen extends StatefulWidget {
//   const NewNoteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewNoteScreen> createState() => _NewNoteScreenState();
// }

// class _NewNoteScreenState extends State<NewNoteScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   final NoteController _noteController = Get.put(NoteController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const BottomNavigation(),
//       floatingActionButton: FloatingActionButton(
//         mini: true,
//         onPressed: () {
//           // _noteController.addNewNote(_titleController.value.text, _bodyController.value.text);
//         },
//         backgroundColor: Get.theme.primaryColor,
//         child: const Icon(Icons.save),
//       ),
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'Note',
//             style: TextStyle(
//                 fontFamily: 'Satoshi',
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         actions: [
//           Row(children: [
//             PopupMenuButton<int>(
//               padding: const EdgeInsets.only(
//                 right: 100,
//               ),
//               color: const Color(0xFFEEFCF9),
//               position: PopupMenuPosition.over,
//               offset: const Offset(0, 0),
//               itemBuilder: (context) => [
//                 // popupmenu item 1
//                 PopupMenuItem(
//                   padding: const EdgeInsets.all(10.5),
//                   value: 1,
//                   // row has two child icon and text.
//                   child: Row(
//                     children: [
//                       Icon(Icons.calendar_today,
//                           color: Get.theme.primaryColor),
//                       const SizedBox(
//                         // sized box with width 10
//                         width: 10,
//                       ),
//                       const Text("Calender")
//                     ],
//                   ),
//                 ),
//                 // popupmenu item 2
//                 PopupMenuItem(
//                   padding: const EdgeInsets.all(10.5),
//                   value: 2,
//                   // row has two child icon and text
//                   child: Row(
//                     children: [
//                       Icon(Icons.sticky_note_2,
//                           color: Get.theme.primaryColor),
//                       const SizedBox(
//                         // sized box with width 10
//                         width: 10,
//                       ),
//                       const Text("Notes")
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem(
//                   padding: const EdgeInsets.all(10.5),
//                   value: 2,
//                   // row has two child icon and text
//                   child: Row(
//                     children: [
//                       Icon(Icons.tag_faces,
//                           color: Get.theme.primaryColor),
//                       const SizedBox(
//                         // sized box with width 10
//                         width: 10,
//                       ),
//                       const Text("About"),
//                     ],
//                   ),
//                 ),
//               ],
//               elevation: 2,
//               child: const Icon(Icons.menu, color: Colors.white),
//             ),
//             Container(
//               width: menuPadding,
//             )
//           ]),
//         ],
//         backgroundColor: Get.theme.primaryColor,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         height: 250,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//         ),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                     padding: const EdgeInsets.only(
//                       top: 10,
//                       right: 16,
//                       left: 16,
//                     ),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                           hintText: 'Tittle',
//                           hintStyle: TextStyle(color: Colors.grey)),
//                       controller: _titleController,
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
//                     )),
//               ),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.only(
//                       top: 10, right: 16, left: 16, bottom: 5),
//                   child: TextField(
//                     controller: _bodyController,
//                     decoration: const InputDecoration(
//                       hintText: 'Note',
//                       hintStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                     style: const TextStyle(
//                       fontFamily: 'Satoshi',
//                       fontSize: 16,
//                       color: Color(0xFFB3B3B3),
//                     ),
//                   ),
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }
