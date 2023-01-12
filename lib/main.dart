import 'package:flutter/material.dart';
import 'package:timetable_app/Screens/Splashscreen.dart';
import 'Constants/primary_color.dart';

import 'Pages/ExamScreen.dart';
import 'Pages/ProfileScreen.dart';
import 'Pages/homeScreen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),

          // home: homeScreen(),
      theme: ThemeData(
          primaryColor: Color(primaryColorCode),
          backgroundColor: Colors.white
      ),

    );
  }
}