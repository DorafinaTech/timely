import 'package:flutter/material.dart';
import 'package:timetable_app/Screens/Splashscreen.dart';

import 'HomePage/ExamScreen.dart';
import 'HomePage/ProfileScreen.dart';
import 'HomePage/homeScreen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(),

          // home: homeScreen(),
      theme: ThemeData(
          primaryColor: Color(0XFF1C8E77),
          backgroundColor: Colors.white
      ),

    );
  }
}