import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel(id: '', name: '', email: '').obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel(id: '', name: '', email: '');
  }
}
