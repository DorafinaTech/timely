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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Recover Password',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // Row(children: [
          //   const MenuButton(
          //     mypopupcolor: Colors.white,
          //   ),
          //   Container(
          //     width: menuPadding,
          //   ),
          //   Container(
          //     width: menuPadding,
          //   ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Center(
              child:  Text(
                "Enter the OTP we have sent to your mobile phone 08147318488 ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Satoshi',
                ),
              ),
            ),
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0),),
              ),
            ),



            Row(children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              Row(children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Didnt get the code?',
                              style: TextStyle(
                                color: Colors.black,

                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              'resend code',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                              ),
                            )
                          ]),
                    ),
                  ),
                ]),
              ]),
            ])
          ]),
        ]),
      ),
    );
  }
}
