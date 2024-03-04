import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/route_paths.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Center(
              // child: Row(children: [
              child: Image.asset("assets/images/babygal.png"),
              // ]),
            ),
            const Center(
              child: Text(
                "Let's get started",
                style: TextStyle(color: Color(0xFFC5DAC9), fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 24,
                right: 24,
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: const Color(0xFFC5DAC9),
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                onPressed: () {
                  Get.offAllNamed(RoutePaths.login);
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(
                right: 24,
                left: 24,
                bottom: 32,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutePaths.register);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFFC5DAC9),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFFC5DAC9),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
