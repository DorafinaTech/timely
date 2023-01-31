import 'package:flutter/material.dart';

import '../Components/bottom navigation.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Notes',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Satoshi',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Row(children: [
              PopupMenuButton<int>(
                padding: EdgeInsets.only(
                  right: 100,
                ),
                color: Color(0xFFEEFCF9),
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
              Container(
                width: 50,
              )
            ]),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          // foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Method of Coding',
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20,
                        color: Color(0xFF03110E)),
                  ),
                  subtitle: Text('30/1/2023',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFFB3B3B3))),
                ),
                Container(height: 30),
                Divider(
                  color: Color(0xFF000000),
                ),
              ],
            ),
          ),
        ));
  }
}
