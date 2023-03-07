import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/route_names.dart';
import 'package:timely/utilities/route_paths.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(),
        Center(
          child: Image.asset("assets/images/girl&boy.png"),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: const Center(
            child: Text(
              "Every moment should count, So make a TimeTable for that here",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w100),
            ),
          ),
        ),
        TextButton(
          child: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "svgs/nexticon.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ]),
          ),
          onPressed: () {
            Get.toNamed(RoutePaths.onboarding3);
          },
        )
      ]),
    )));
  }
}
