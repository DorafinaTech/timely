import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../constants/menu_padding.dart';
import 'notes.dart';

class FloatingButtonForNote extends StatefulWidget {
  FloatingButtonForNote({Key? key}) : super(key: key);

  @override
  State<FloatingButtonForNote> createState() => _FloatingButtonForNoteState();
}

class _FloatingButtonForNoteState extends State<FloatingButtonForNote> {
  final TextEditingController _control = TextEditingController();
  final TextEditingController _controll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notes()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Note',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Row(children: [
            PopupMenuButton<int>(
              padding: const EdgeInsets.only(
                right: 100,
              ),
              color: const Color(0xFFEEFCF9),
              position: PopupMenuPosition.over,
              offset: const Offset(0, 0),
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("Calender")
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.sticky_note_2,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("Notes")
                    ],
                  ),
                ),
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.tag_faces,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("About"),
                    ],
                  ),
                ),
              ],
              elevation: 2,
              child: const Icon(Icons.menu, color: Colors.white),
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: 250,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, right: 16, left: 16,),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Tittle',
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _control,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
                    )),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, right: 16, left: 16, bottom: 5),
                  child: TextField(
                    controller: _controll,
                    decoration: const InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16,
                      color: Color(0xFFB3B3B3),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
