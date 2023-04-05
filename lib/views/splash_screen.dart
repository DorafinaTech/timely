import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      if (_authController.currentUser.value != null) {
        Get.offAllNamed(RoutePaths.homeScreen);
      }

      Get.offAllNamed(RoutePaths.onboarding1);
    });

    return Scaffold(
      // ignore: use_full_hex_values_for_flutter_colors
      backgroundColor: const Color(0xffff1c8e77),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/timely.gif"),
          ),
        ],
      )),
    );
  }
}
