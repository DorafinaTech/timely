import 'package:flutter/material.dart';
import 'package:timetable_app/Components/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          PopupMenuButton<int>(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.teal,
              padding: EdgeInsets.all(20),
              // padding: EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60.0,
                child: Image(
                  image: AssetImage("assets/images/thessC.png"),
                ),
              ),
              ),
            Text(
              'Thessy Emmanuel',
              style: TextStyle(
                  fontFamily: 'Satoshi', fontSize: 16, color: Colors.black),
            ),
            Text(
              'thessyzilla@gmail.com',
              style: TextStyle(
                  fontFamily: 'Satoshi', fontSize: 16, color: Colors.black54),
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.only(
                right: 84,
                left: 84,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  maximumSize: Size(double.infinity, 100),
                  backgroundColor: Color(0XFF1C8E77),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Color(0xFFE6E6E6),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Image.asset('svgs/Alarm.png',
                // height: 20,width: 20,),
            ),
            ),
            Text('Activities',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('svgs/Note.png', height: 20,width: 20,),
            ),
            Text(
              'Notes',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('svgs/Rate.png', height: 20,width: 20,),
            ),
            Text(
              'Rate',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('svgs/Share.png', height: 20,width: 20,),
            ),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('svgs/Logout.png', height: 20,width: 20,),
            ),
            Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
