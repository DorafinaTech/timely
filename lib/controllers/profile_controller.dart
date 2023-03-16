import 'package:timely/controllers/base_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileController extends BaseController {
  Future<bool> updateProfilePicture(String newURL) async {
    return false;
  }

  Future<bool> updateBioData(
      String name, String email, String phoneNumber) async {
    return false;
  }

  Future<bool> getBioData() async {
    return false;
  }
}
