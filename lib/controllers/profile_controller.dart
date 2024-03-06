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

import 'base_controller.dart';

class ProfileController extends BaseController {
  var currentProfilePictureURL =
      'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='
          .obs;

  final LoadingController _loadingController =
      Get.put<LoadingController>(LoadingController());

  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  @override
  void onReady() {
    getBioData().then((bioData) {
      currentProfilePictureURL.value = bioData['photoURL'];
      debugPrint('Profile getxController has been initialized');
      updateProfilePicture();
    });

    return super.onReady();
  }

  Future<void> updateProfilePicture() async {
    try {
      var imagePicker = ImagePicker();
      var pickedImageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      _loadingController.startLoading();

      await FirebaseStorage.instance
          .ref('profilePictures/${_authController.currentUser.value?.uid}')
          .putData(await pickedImageFile!.readAsBytes())
          .whenComplete(() async {
        var downloadURL = await FirebaseStorage.instance
            .ref('profilePictures/${_authController.currentUser.value?.uid}')
            .getDownloadURL();

        debugPrint('New profile picture download URL is: $downloadURL');

        await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadURL);
        currentProfilePictureURL.value = downloadURL;
        _authController.update();
        updateProfilePicture();

        debugPrint('Updated');

        await _loadingController.stopLoading();

        showSnackbar('Success', 'Your profile picture has been updated');
      });
    } catch (e) {
      await _loadingController.stopLoading();
      showErrorSnackbar('Unable to update profile picture');
      debugPrint('Failed to update profile photo: $e');
    }
  }

  Future<void> updateBioData(
      String name, String email, String phoneNumber) async {
    _loadingController.startLoading();

    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);

      _authController.currentUser.value = FirebaseAuth.instance.currentUser;
      _authController.update();
      update();

      showSnackbar('Successful', 'Your profile info has been updated');

      _loadingController.stopLoading();

      await Get.toNamed(RoutePaths.homeScreen);
    } catch (e) {
      _loadingController.stopLoading();

      debugPrint(e.toString());
    }
  }

  Future<Map> getBioData() async {
    try {
      var bioData = {};

      bioData['name'] = _authController.currentUser.value!.displayName ?? '';
      bioData['email'] = _authController.currentUser.value!.email ?? '';
      bioData['phoneNumber'] =
          _authController.currentUser.value!.phoneNumber ?? '';
      bioData['photoURL'] =
          (_authController.currentUser.value!.photoURL != null)
              ? _authController.currentUser.value!.photoURL
              : currentProfilePictureURL.value;

      currentProfilePictureURL.value = bioData['photoURL'];

      _authController.currentUser.value = FirebaseAuth.instance.currentUser;
      _authController.update();
      update();

      return bioData;
    } catch (exception) {
      debugPrint('\n\n\n\n\n$exception\n\n\n\n\n');

      return {};
    }
  }
}
