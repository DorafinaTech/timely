import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/controllers/profile_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:share_plus/share_plus.dart';

import '../components/popup_menu_buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  final ProfileController _profileController =
      Get.put<ProfileController>(ProfileController());

  @override
  void initState() {
    _profileController.getBioData();

    super.initState();
  }

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
            const MenuButton(
              popupColor: Colors.black,
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => CircleAvatar(
                    radius: 50.0,
                    // backgroundImage: NetworkImage('assets/images/thessC.png'),
                    backgroundImage: NetworkImage(
                        _profileController.currentProfilePictureURL.value),
                    backgroundColor: Get.theme.primaryColor,
                  )),
              Text(
                _authController.currentUser.value?.displayName! ?? '',
                style: const TextStyle(
                    fontFamily: 'Satoshi', fontSize: 16, color: Colors.black),
              ),
              Text(
                _authController.currentUser.value?.email! ?? '',
                style: const TextStyle(
                    fontFamily: 'Satoshi', fontSize: 16, color: Colors.black54),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(
                  right: 84,
                  left: 84,
                  top: 10,
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
                onTap: () {
                  Share.share('check out this ');
                },
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
                  await _authController.signOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _onShare {

}
