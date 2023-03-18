import 'package:firebase_auth/firebase_auth.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends BaseController {
  Future<bool> updateProfilePicture(String newURL) async {
    ImagePicker();

    FirebaseStorage.instance;

    return false;
  }

  Future<bool> updateBioData(
      String name, String email, String phoneNumber) async {
    FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    FirebaseAuth.instance.currentUser!.updateEmail(email);

    return false;
  }

  Future<Map> getBioData() async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      var bioData = {};

      bioData['name'] = user.displayName ?? '';
      bioData['email'] = user.email ?? '';

      return bioData;
    } catch (exception) {
      showErrorSnackbar(
          'Unable to retrive your profile info, please check your network connection');
      return {};
    }
  }
}
