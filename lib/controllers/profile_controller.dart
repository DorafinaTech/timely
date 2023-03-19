import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/controllers/loading_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/show_snackbar.dart';

class ProfileController extends BaseController {
  var currentProfilePictureURL =
      'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='
          .obs;

  final LoadingControler _loadingController =
      Get.put<LoadingControler>(LoadingControler());

  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  @override
  void onInit() {
    super.onInit();

    getBioData().then((bioData) {
      currentProfilePictureURL.value = bioData['photoURL'];
      debugPrint('Profile getxController has been initialized');
      update();
    });
  }

  Future<void> updateProfilePicture() async {
    try {
      var imagePicker = ImagePicker();
      var pickedImageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      await _loadingController.startLoading();

      await FirebaseStorage.instance
          .ref('profilePictures/${_authController.currentUser!.uid}')
          .putData(await pickedImageFile!.readAsBytes())
          .whenComplete(() async {
        var downloadURL = await FirebaseStorage.instance
            .ref('profilePictures/${_authController.currentUser!.uid}')
            .getDownloadURL();

        debugPrint('New profile picture download URL is: $downloadURL');

        await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadURL);

        currentProfilePictureURL.value = downloadURL;
        update();

        debugPrint('Updated');

        await _loadingController.stopLoading();

        showSnackbar('Success', 'Your profile picture has been updated');
      });
    } catch (e) {
      _loadingController.stopLoading();
      showErrorSnackbar('Unable to update profile picture');
      debugPrint('Failed to update profile photo: $e');
    }
  }

  Future<void> updateBioData(
      String name, String email, String phoneNumber) async {
    try {
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      FirebaseAuth.instance.currentUser!.updateEmail(email);

      showSnackbar('Successful', 'Your profile info has been updated');

      Get.toNamed(RoutePaths.homeScreen);
    } catch (e) {
      debugPrint(e.toString());
      showErrorSnackbar('Unable to update prfile info at this time');
    }
  }

  Future<Map> getBioData() async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      var bioData = {};

      bioData['name'] = user.displayName ?? '';
      bioData['email'] = user.email ?? '';
      bioData['photoURL'] = (user.photoURL != null)
          ? user.photoURL.obs
          : currentProfilePictureURL.value;

      currentProfilePictureURL = bioData['photoURL'].obs;
      update();

      return bioData;
    } catch (exception) {
      showErrorSnackbar(
          'Unable to retrive your profile info, please check your network connection');
      return {};
    }
  }
}
