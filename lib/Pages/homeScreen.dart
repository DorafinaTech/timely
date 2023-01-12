//
//
import 'package:flutter/material.dart';
import 'package:timetable_app/Components/bottom_nav.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            padding: EdgeInsets.only(right: 200,),
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
        child: Expanded(
          child: ListView(children: [
            ListTile(
              leading: ClipOval(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/thessC.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                'Hey, Thessy!',
                style: TextStyle(fontFamily: 'Satohi', fontSize: 16),
              ),
              subtitle: Text(
                'lets get things Scheduled, shall we?',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14,
                ),
              ),
              tileColor: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFEEFCF9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: Icon(
                  Icons.calendar_today,
                  size: 50,
                  color: Color(0xFF1C8E77),
                ),
                selectedColor: Theme.of(context).primaryColor,
                title: Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                subtitle: Text(
                  'Thursady 5th January 2023',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFFFEBEB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: Icon(
                  Icons.weekend,
                  size: 50,
                  color: Color(0xFFFF5D5A),
                ),
                title: Text(
                  'Week Review',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                subtitle: Text(
                  'Scheduled set for the week',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFEEFCF9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: Icon(
                  Icons.note_add,
                  size: 50,
                  color: Color(0xFF1C8E77),
                ),
                title: Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                subtitle: Text(
                  'Save your thoughts',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
