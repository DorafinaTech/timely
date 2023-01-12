import 'package:flutter/material.dart';
import '../Constants/primary_color.dart';


class CalenderAppBar  extends AppBar{
  Color backgroundColor = Color(primaryColorCode);
  Color foregroundColor = Colors.white;
   CalenderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      actions: [
        PopupMenuButton<int>(
          padding: EdgeInsets.only(right: 200,),
          color: Colors.black,
          position: PopupMenuPosition.over,
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          offset: Offset(0, 0),
          itemBuilder: (context) => [
            // popupmenu item 1
            PopupMenuItem(
              padding: EdgeInsets.all(10.5),
              value: 1,
              // row has two child icon and text.
              child: Row(
                children: [
                  Icon(Icons.calendar_today,
                      color: Theme.of(context).primaryColor),
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
              value: 2,
              // row has two child icon and text
              child: Row(
                children: [
                  Icon(Icons.sticky_note_2,
                      color: Theme.of(context).primaryColor),
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
              child: Row(
                children: [
                  Icon(Icons.tag_faces,
                      color: Theme.of(context).primaryColor),
                  SizedBox(
                    // sized box with width 10
                    width: 10,
                  ),
                  Text("About")
                ],
              ),
            ),
          ],
          elevation: 2,
        ),
      ],
      elevation: 0,
    );

  }
}
