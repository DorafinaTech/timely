import 'dart:async';
import 'package:flutter/material.dart';
import 'Onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (BuildContext context) =>
                Onboarding()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFF1C8E77),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("assets/images/student.png"),
                ),
                const Center(
                  child: Text(
                    "School TimeTable",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'satoshi',
                        fontSize: 30
                    ),
                  ),
                )
              ],
            )),
      );
  }
}






