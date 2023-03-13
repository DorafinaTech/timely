import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_snackbar.dart';
import 'package:timely/views/notes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
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
              padding: const EdgeInsets.only(
                right: 100,
              ),
              color: const Color(0xFFEEFCF9),
              position: PopupMenuPosition.over,
              offset: const Offset(0, 0),
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("Calender")
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.sticky_note_2,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("Notes")
                    ],
                  ),
                ),
                PopupMenuItem(
                  padding: const EdgeInsets.all(10.5),
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.tag_faces,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      const Text("About"),
                    ],
                  ),
                ),
              ],
              elevation: 2,
              child: const Icon(Icons.menu, color: Colors.black),
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
      bottomNavigationBar: const BottomNavigation(),
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   onPressed: () {},
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: const Icon(Icons.add),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/thessC.png'),
                backgroundColor: Colors.transparent,
              ),
              const Text(
                'Thessy Emmanuel',
                style: TextStyle(
                    fontFamily: 'Satoshi', fontSize: 16, color: Colors.black),
              ),
              const Text(
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
                    Get.toNamed(RoutePaths.editProfileScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    maximumSize: const Size(double.infinity, 100),
                    backgroundColor: const Color(0XFF1C8E77),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Satoshi',
                        fontSize: 14),
                  ),
                ),
              ),
              Container(height: 30),
              const Divider(
                color: Color(0xFF000000),
              ),
              Container(height: 15),
              // ListTile(
              //   dense: true,
              //   contentPadding:
              //       const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              //   leading: Container(
              //     margin: EdgeInsets.zero,
              //     padding: const EdgeInsets.all(8.0),
              //     child: Image.asset(
              //       'svgs/Alarm.png',
              //       // height: 20,width: 20,),
              //     ),
              //   ),
              //   title: const Text(
              //     'Activities',
              //     style: TextStyle(color: Colors.black, fontSize: 16),
              //   ),
              // ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Note.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                onTap: () {
                  Get.toNamed(RoutePaths.notescreen);
                },
                title: const Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Rate.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                title: const Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'svgs/Share.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                title: const Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'svgs/Logout.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () async {

                  AuthController().signout().then((value) {
                    if (value) {
                      Get.toNamed(RoutePaths.login);
                      showSnackbar("Alert", "You've logged out");
                    } else {
                      showSnackbar("Alert", "Logout failed");
                    }
                  }).catchError((error) {
                    showSnackbar("Alert", "Logout failed");

                    if (kDebugMode) {
                      print(error);
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
