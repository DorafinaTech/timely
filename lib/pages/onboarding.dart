import 'package:flutter/material.dart';
import 'package:timely/login.dart';
import 'package:timely/pages/onboarding2.dart';


import 'register.dart';

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
            Container(
              margin: const EdgeInsets.only(
                  // left: 50,
                  // top: 50,
                  // bottom: 100,
                  ),
              child: Center(
                // child: Row(children: [
                child: Image.asset("assets/images/babygal.png"),
                // ]),
              ),
            ),
            const Center(
              child: Text(
                "Let's get started",
                style: TextStyle(color: Colors.teal, fontSize: 20),
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
                  backgroundColor: Colors.teal,
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Onboarding2()));
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
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
                    color: Colors.teal,
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.teal,
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
