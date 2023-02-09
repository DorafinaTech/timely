import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timely/utilities/route_names.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/pages/home_screen.dart';

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
          onPressed: () {
            context.canPop()
                ? context.pop()
                : context.goNamed(RouteNames.profileScreen);
          },
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
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  // labelText: 'Name',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      color: Colors.black54),
                  hintText: "Thessy Emmanuel",
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
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
