import 'package:flutter/material.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Get.toNamed(RoutePaths.profileScreen),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Center(
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
              const MenuButton(
                popupColor: Colors.black,
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
          Stack(children: [
            Positioned(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/thessC.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Positioned(
                bottom: 0.2,
                right: 0.2,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ))),
          ]),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "First Name ",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Last Name ",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Email Address",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Phone Number",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutePaths.homeScreen);
              },
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      60,
                    ),
                  ),
                ),
                maximumSize: const Size(double.infinity, 100),
                backgroundColor: Colors.teal,
                side: const BorderSide(
                  color: Colors.teal,
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
