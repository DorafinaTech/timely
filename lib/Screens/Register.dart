import 'package:flutter/material.dart';
import 'package:timely/Pages/homeScreen.dart';
import 'package:timely/Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Text(
                  "Register and lets get started ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(8.0),
              child: OutlinedButton(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'svgs/google_icon.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Text(
                        'Sign up with Google',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.teal.shade100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Row(
                  children: [
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
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: " First and last name",
                    hintStyle: TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: " Email Address",
                    hintStyle: TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "start with your country code (+234)",
                    hintStyle: TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: Colors.teal.shade100,
                            width: 1.0,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "confirm Password",
                    hintStyle: TextStyle(color: Colors.black54),
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
              margin: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homeScreen(),
                    ),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                      // backgroundColor: Colors.pink,
                    ),
                  ),
                  maximumSize: Size(double.infinity, 100),
                  backgroundColor: Colors.teal,
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Text(
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
