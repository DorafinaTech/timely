import 'package:flutter/material.dart';
import 'package:timetable_app/Components/popup_menu%20_buttons.dart';
import 'package:timetable_app/Constants/menu_padding.dart';
import 'package:timetable_app/Recovery/email_recovery.dart';
class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({Key? key}) : super(key: key);

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailRecovery(),
                          ),
                        );
                      },
                      child: Text(
                        'Email',
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
                              50,
                            ),
                          ),
                        ),
                        maximumSize: Size(double.infinity, 100),
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.teal,
                        ),
                      ),
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
                            builder: (context) => EmailRecovery(),
                          ),
                        );
                      },
                      child: Text(
                        'Phone Number',
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
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],

        ),
      ),
    );

  }
}
