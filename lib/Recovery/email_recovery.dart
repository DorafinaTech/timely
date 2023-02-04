import 'package:flutter/material.dart';
import 'package:timetable_app/Components/popup_menu%20_buttons.dart';
import 'package:timetable_app/Constants/menu_padding.dart';

class EmailRecovery extends StatefulWidget {
  const EmailRecovery({Key? key}) : super(key: key);

  @override
  State<EmailRecovery> createState() => _EmailRecoveryState();
}

class _EmailRecoveryState extends State<EmailRecovery> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          MenuButton(
            mypopupcolor: Colors.white,
          ),
          Container(
            width: menuPadding,
          ),
          Container(
            width: menuPadding,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                  hintText: "Type Registered phone number here",
                  hintStyle: TextStyle(color: Colors.black54),
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
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
                  ),
                );
              },
              child: Text(
                'Proceed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      60,
                    ),
                  ),
                ),
                maximumSize: Size(double.infinity, 100),
                backgroundColor: Colors.teal,
                side: const BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    ])));
  }
}
