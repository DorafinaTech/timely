import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/controllers/profile_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:timely/utilities/show_snackbar.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final ProfileController _profileController =
      Get.put<ProfileController>(ProfileController());

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
            const Positioned(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/thessC.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Positioned(
                bottom: 0.2,
                right: 0.2,
                child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Get.theme.primaryColor, width: .5)),
                    child: Center(
                      child: IconButton(
                          iconSize: 15,
                          onPressed: () {
                            _profileController.updateProfilePicture();
                          },
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Get.theme.primaryColor,
                          )),
                    ))),
          ]),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: const TextStyle(
                    fontSize: 20, fontFamily: 'Satoshi', color: Colors.black54),
                hintText: "Your First name ",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                        style: BorderStyle.solid)),
                alignLabelWithHint: false,
                filled: false,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: const TextStyle(
                    fontSize: 20, fontFamily: 'Satoshi', color: Colors.black54),
                hintText: "your Last Name ",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                        style: BorderStyle.solid)),
                alignLabelWithHint: false,
                filled: false,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailAddressController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: const TextStyle(
                    fontSize: 20, fontFamily: 'Satoshi', color: Colors.black54),
                hintText: " Your Email Address",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                        style: BorderStyle.solid)),
                alignLabelWithHint: false,
                filled: false,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF6FDFC),
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(
                    fontSize: 20, fontFamily: 'Satoshi', color: Colors.black54),
                hintText: " Your Phone Number",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.5,
                        style: BorderStyle.solid)),
                alignLabelWithHint: false,
                filled: false,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _profileController
                    .updateBioData(
                        '${_firstNameController.value.text.trim()} ${_lastNameController.value.text.trim()}',
                        _emailAddressController.value.text.trim(),
                        _phoneNumberController.value.text.trim())
                    .then((value) {
                  showSnackbar(
                      'Successful', 'Your profile info has been updated');

                  Get.toNamed(RoutePaths.homeScreen);
                }).catchError((err) {
                  debugPrint(err.toString());
                  showErrorSnackbar(
                      'Unable to update prfile info at this time');
                });
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
