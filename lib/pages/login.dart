import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/pages/recover_password.dart';
import 'package:timely/pages/register.dart';
import 'package:timely/utilities/route_names.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: const Text(
                "Log in and Let's get started",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () async {
                if (await AuthController().signInwithGoogle()) {
                  context.goNamed(RouteNames.homeScreen);
                } else {
                  Get.snackbar("Oops", "Something went wrong");
                }
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal.shade200),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'svgs/google_icon.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const Text(
                    'Log in with Google',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black54,
                    ),
                  ),
                  Text('  Or  '),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email Addresss",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.teal.shade200,
                          width: 1.5,
                          style: BorderStyle.solid))),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.black54),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.teal.shade200,
                        width: 1.5,
                        style: BorderStyle.solid)),
              ),
            ),
          ),
          // const Login(),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecoveryPassword()),
              );
            },
          ),

          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                AuthController().signInwithEmailAndPassword(
                    _emailController.value.text,
                    _passwordController.value.text);
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
                        context.goNamed(RouteNames.register);
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
    ));
  }
}
