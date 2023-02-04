import 'package:flutter/material.dart';
import 'package:timely/Screens/Splashscreen.dart';
import 'Constants/primary_color.dart';

void main() {
  runApp(const TimelyApp());
}

class TimelyApp extends StatelessWidget {
  const TimelyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),

      // home: homeScreen(),
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(primaryColorCode),
          primarySwatch: ,
          backgroundColor: Colors.white),
    );
  }
}
