import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timely/screens/onboarding2.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Onboarding2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff1c8e77),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/timely.gif"),
          ),
          // const Center(
          //   child: Text(
          //     "Timely",
          //     style: TextStyle(
          //         color: Colors.white, fontFamily: 'satoshi', fontSize: 30, fontWeight: FontWeight.bold),
          //   ),

        ],
      )),
    );
  }
}
