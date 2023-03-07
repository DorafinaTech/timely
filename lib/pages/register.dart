import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/utilities/route_paths.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final TextEditingController _firstAndLastNameController =
      TextEditingController();
  bool passwordVisible = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  "Register and lets get started ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   margin: const EdgeInsets.all(8.0),
            //   child: OutlinedButton(
            //     onPressed: () async {
            //       String userMessage = '';
            //       AuthController().signInwithGoogle().then((value) {
            //         if (value) {
            //           Get.offAllNamed(RoutePaths.homeScreen);
            //           userMessage = "Login in successfully";
            //           debugPrint(userMessage);
            //         }
            //       }).catchError((error) {
            //         userMessage = "Login failed, Something went wrong";
            //         Get.snackbar("Oops", userMessage);
            //         debugPrint(userMessage);
            //
            //         if (kDebugMode) {
            //           print(error);
            //         }
            //       });
            //     },
            //     style: OutlinedButton.styleFrom(
            //         side: BorderSide(color: Colors.teal.shade100),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         // Container(
            //         //   padding: const EdgeInsets.all(8.0),
            //         //   child: Image.asset(
            //         //     'svgs/google_icon.png',
            //         //     height: 20,
            //         //     width: 20,
            //         //   ),
            //         // ),
            //         // const Text(
            //         //   'Sign up with Google',
            //         //   style: TextStyle(
            //         //     color: Colors.teal,
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Text('  Or  '),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _firstAndLastNameController,
                decoration: InputDecoration(
                    hintText: " First and last name",
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: " Email Address",
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                    hintText: "start with your country code (+234)",
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: passwordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                          color: Colors.teal.shade100,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  helperStyle: TextStyle(
                    color: Colors.teal.shade200,
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
                controller: _confirmPasswordController,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                    hintText: " Confirm Password",
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  AuthController()
                      .register(
                          _emailController.value.text.trim(),
                          _passwordController.value.text.trim(),
                          _phoneNumberController.value.text.trim(),
                          _firstAndLastNameController.value.text.trim())
                      .then((value) {
                    if (value) {
                      Get.toNamed(RoutePaths.homeScreen);
                    }
                  }).catchError((error) {
                    Get.snackbar("Oops", "Sign in failed");
                    if (kDebugMode) {
                      print(error);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: Colors.teal,
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(RoutePaths.login);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 13,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
