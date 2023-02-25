import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timely/utilities/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 7),
        () => context.pushReplacementNamed(RouteNames.onboarding1));

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
