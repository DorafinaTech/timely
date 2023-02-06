import 'package:flutter/material.dart';
import 'package:timely/components/bottom_nav.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/recovery/otp_number.dart';

class EmailRecovery extends StatefulWidget {
  const EmailRecovery({Key? key}) : super(key: key);

  @override
  State<EmailRecovery> createState() => _EmailRecoveryState();
}

class _EmailRecoveryState extends State<EmailRecovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Recover Password',
              style: TextStyle(fontFamily: 'Satoshi', fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        // Row(
        //   children: [
        //     const MenuButton(
        //       mypopupcolor: Colors.white,
        //     ),
        //     Container(
        //       width: menuPadding,
        //     ),
        //     Container(
        //       width: menuPadding,
        //     ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintStyle: const TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.teal.shade200,
                            width: 1.5,
                            style: BorderStyle.solid))),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpNumber(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        60,
                      ),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: Colors.teal,
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
  }
}
