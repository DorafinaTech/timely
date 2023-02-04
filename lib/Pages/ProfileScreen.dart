import 'package:flutter/material.dart';
import 'package:timely/Components/bottom_nav.dart';
import 'package:timely/Login.dart';
import 'package:timely/Constants/menu_padding.dart';

import 'Edit page.dart';

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
          Row(children: [
            PopupMenuButton<int>(
              padding: EdgeInsets.only(
                right: 100,
              ),
              color: Color(0xFFEEFCF9),
              position: PopupMenuPosition.over,
              child: Icon(Icons.menu, color: Colors.black),
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
                      Text("About"),
                    ],
                  ),
                ),
              ],
              elevation: 2,
            ),
            Container(
              width: menuPadding,
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
            children: [
              ClipOval(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/thessC.png',
                    fit: BoxFit.fill,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (Context) => EditPage(),
                      ),
                    );
                  },
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
              Container(height: 30),
              Divider(
                color: Color(0xFF000000),
              ),
              Container(height: 15),
              ListTile(
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Alarm.png',
                    // height: 20,width: 20,),
                  ),
                ),
                title: Text(
                  'Activities',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Note.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                title: Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Rate.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                title: Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Share.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                title: Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  leading: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'svgs/Logout.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
