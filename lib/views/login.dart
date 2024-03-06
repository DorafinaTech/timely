import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/controllers/loading_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/utilities/show_error_snackbar.dart';
import 'package:timely/utilities/show_snackbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthController _authController =
      Get.put<AuthController>(AuthController());
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: const Center(
                        child: Text(
                          "Login, Let's get started",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        if (!GetUtils.isEmail(value)) {
                          return "Email is not valid";
                        }

                        return null;
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        alignLabelWithHint: false,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: !passwordVisible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        helperText: "Password must contain special Characters",
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          color: const Color(0xFFC5DAC9),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(RoutePaths.resetPasswordViaEmail);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          LoadingController().startLoading();

                          var userMessage = "";

                          _authController
                              .signInwithEmailAndPassword(
                                  _emailController.value.text.trim(),
                                  _passwordController.value.text.trim())
                              .then((value) {
                            if (value) {
                              LoadingController().stopLoading();
                              Get.offAllNamed(RoutePaths.homeScreen);

                              userMessage = "Login in successfully";
                              debugPrint(userMessage);
                            } else {
                              LoadingController().stopLoading();
                              showErrorSnackbar(
                                  "Login failed, Something went wrong");
                            }
                          }).onError((error, stackTrace) {
                            LoadingController().stopLoading();

                            userMessage = "Login failed, $error";
                            showSnackbar("Oops", userMessage);
                            debugPrint(userMessage);
                          });
                        }
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
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(RoutePaths.register);
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
