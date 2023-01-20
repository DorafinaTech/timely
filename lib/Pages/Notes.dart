import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black54,
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
                color: Colors.black,
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container()],
          ),
        ),
      ),
    );
  }
}
