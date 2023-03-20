import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:timely/utilities/show_snackbar.dart';

class ConfirmPassword extends StatelessWidget {
  ConfirmPassword({Key? key}) : super(key: key);

  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Recover Password',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: passwordVisible,
                controller: _newPasswordController,
                decoration: InputDecoration(
                  hintText: " Strong password",
                  labelText: "New Password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.teal.shade200,
                          width: 1.5,
                          style: BorderStyle.solid)
                  ),
                  suffixIcon: IconButton(
                    color: Colors.teal.shade200,
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: _otpController,
                decoration: InputDecoration(
                  hintText: "Your OTP",
                  labelText: "OTP",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.teal.shade200,
                          width: 1.5,
                          style: BorderStyle.solid)
                  ),
                  suffixIcon: IconButton(
                    color: Colors.teal.shade200,
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,

                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 50, left: 8, right: 8),
              child: ElevatedButton(
                onPressed: () {
                  _authController
                      .confirmPasswordReset(_otpController.value.text,
                          _newPasswordController.value.text)
                      .then((value) {
                    showSnackbar('Successful',
                        'Your pasword has been updated, Login with the new password');
                    Get.toNamed(RoutePaths.login);
                  }).catchError((err) {
                    debugPrint(err.toString());

                    showErrorSnackbar(
                        'Password rest failed, network error or wrong OTP provided');
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
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
