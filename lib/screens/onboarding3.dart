import 'package:flutter/material.dart';
import 'package:timely/login.dart';

class onboarding3 extends StatelessWidget {
  const onboarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(
              // left: 50,
              // top: 50,
              // bottom: 100,
              ),
          child: Center(
            // child: Row(children: [
            child: Image.asset("assets/images/girl&boy.png"),
            // ]),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
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
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  "svgs/nexticon.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ]),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Login()));
          },
        )
      ]),
    )));
  }
}
