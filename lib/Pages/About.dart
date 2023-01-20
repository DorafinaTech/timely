import 'package:flutter/material.dart';

import '../Components/popup_menu _buttons.dart';
import '../Constants/menu_padding.dart';
import '../FloatingActionButton/my_floating_modal_button.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          title: Text(
            'About',
          ),
          actions: [
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
                )
              ],
            )
          ],
          elevation: 0,
        ),
        body: Container(
          // padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'This app is Developed solely for students to help them manage their school Activites',
                  style: TextStyle(
                      color: Color(0xFF808080),
                      fontFamily: 'Satoshi',
                      fontSize: 16),
                ),
              ),
              Text(
                'Developers info',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Satoshi',
                    fontSize: 16),
              ),
              Text(
                'Thessy Emmanuel',
                style: TextStyle(
                    color: Color(0xFF808080),
                    fontFamily: 'Satoshi',
                    fontSize: 16),
              ),
              Text(
                'thessyzilla@gmail.com',
                style: TextStyle(
                    color: Color(0xFF808080),
                    fontFamily: 'Satoshi',
                    fontSize: 16),
              ),
      Container(height: 30),
      Divider(
        color: Color(0xFF000000),
      ),
      Container(height: 15),
      ListTile(
        dense: true,
      ),
              Text(
                'Social Meduim',
                style: TextStyle(
                    color: Color(0xFF808080),
                    fontFamily: 'Satoshi',
                    fontSize: 16),
              ),
              ListTile(
              )

            ],
          ),
        ));
  }
}
