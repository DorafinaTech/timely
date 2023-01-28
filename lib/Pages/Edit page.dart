import 'package:flutter/material.dart';
import 'package:timetable_app/Components/popup_menu%20_buttons.dart';
import 'package:timetable_app/Constants/menu_padding.dart';
import 'package:timetable_app/Pages/homeScreen.dart';

import '../Components/bottom navigation.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Satoshi',
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              MenuButton(
                mypopupcolor: Colors.black,
              ),
              Container(
                width: menuPadding,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       labelText: 'Name',
          //       labelStyle: TextStyle(
          //           fontFamily: 'Satoshi',
          //           fontSize: 16,
          //           color: Color(
          //             0xFF03110E,
          //           )),
          //       hintText: 'Thessy Emmanuel',
          //       hintStyle: TextStyle(
          //           fontFamily: 'Satoshi', fontSize: 13, color: Colors.black54),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(style: BorderStyle.solid, width: 1.5,
          //             color: Color(0xFFF6FDFC)),
          //         borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(20.0),
          //           bottomRight: Radius.circular(20.0),
          //           topLeft: Radius.circular(20.0),
          //           topRight: Radius.circular(20.0),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            color: Color(0xFFF6FDFC),
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Thessy Emmanuel",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            color: Color(0xFFF6FDFC),
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            color: Color(0xFFF6FDFC),
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => homeScreen(),
                  ),
                );
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      60,
                    ),
                  ),
                ),
                maximumSize: Size(double.infinity, 100),
                backgroundColor: Colors.teal,
                side: const BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
