//
//
import 'package:flutter/material.dart';
import 'package:timetable_app/Components/bottom%20navigation.dart';
import 'package:timetable_app/Components/bottom_nav.dart';
import 'package:timetable_app/Components/popup_menu _buttons.dart';
import 'package:timetable_app/Constants/menu_padding.dart';
import 'package:timetable_app/FloatingActionButton/my_floating_modal_button.dart';
import 'package:timetable_app/Pages/ExamScreen.dart';
import 'package:timetable_app/Pages/Notes.dart';
import 'package:timetable_app/Pages/calender_screen.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              MenuButton(
                mypopupcolor: Colors.black,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
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
                onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>CalenderScreen(),
                        ),
                      );
                    },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ExamScreen(),
                    ),
                  );
                },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>Notes(),
                    ),
                  );
                },
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
