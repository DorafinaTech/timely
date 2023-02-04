import 'package:flutter/material.dart';
import 'package:timely/Pages/Notes.dart';
import 'package:timely/Pages/ProfileScreen.dart';
import 'package:timely/Pages/calender_screen.dart';

import '../Pages/About.dart';
import '../Pages/homeScreen.dart';

class MenuButton extends StatelessWidget {
  MenuButton({Key? key, required this.mypopupcolor}) : super(key: key);

  final Color mypopupcolor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int index) {
        Widget nextPage = Container();
        switch (index) {
          case 0:
            nextPage = CalenderScreen();
            break;
          case 1:
            nextPage = Notes();
            break;
          case 2:
            nextPage = About();
            break;
        }

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextPage));
      },
      padding: EdgeInsets.only(
        right: 200,
      ),
      color: Color(0xFFEEFCF9),
      position: PopupMenuPosition.over,
      child: Icon(
        Icons.menu,
        color: mypopupcolor,
      ),
      offset: Offset(0, 0),
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          padding: EdgeInsets.all(10.5),
          value: 0,
          // row has two child icon and text.
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text("Calender")
            ],
          ),
        ),
        // popupmenu item 2
        PopupMenuItem(
          padding: EdgeInsets.all(10.5),
          value: 1,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(Icons.sticky_note_2, color: Theme.of(context).primaryColor),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text("Notes")
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.all(10.5),
          value: 2,
          // row has two child icon and text
          child: Row(children: [
            Icon(Icons.tag_faces, color: Theme.of(context).primaryColor),
            SizedBox(
              // sized box with width 10
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => About(),
                      ));
                },
                child: Text("About",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Satoshi'))),
          ]),
        ),
      ],
      elevation: 2,
    );
  }
}
