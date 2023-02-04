import 'package:flutter/material.dart';
import 'package:timetable_app/Components/popup_menu%20_buttons.dart';
import 'package:timetable_app/Constants/menu_padding.dart';

class OtpNumber extends StatefulWidget {
  const OtpNumber({Key? key}) : super(key: key);

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(children: [
        MenuButton(
          mypopupcolor: Colors.white,
        ),
        Container(
          width: menuPadding,
        ),
        Container(
          width: menuPadding,
        ),
        Text(
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
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
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
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text(
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
    ])));
  }
}
