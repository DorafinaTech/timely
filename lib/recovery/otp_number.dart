import 'package:flutter/material.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/screens/register.dart';

class OtpNumber extends StatefulWidget {
  const OtpNumber({Key? key}) : super(key: key);

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(children: [
        const MenuButton(
          mypopupcolor: Colors.white,
        ),
        Container(
          width: menuPadding,
        ),
        Container(
          width: menuPadding,
        ),
        const Text(
          "Enter the OTP we have sent to your mobile phone 08147318488 ",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Satoshi',
          ),
        ),
        Row(
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Didnt get the code?',
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
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ))
            ]),
          ),
        )
      ])
    ]));
  }
}
