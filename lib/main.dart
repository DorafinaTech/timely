import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timely/screens/splash_screen.dart';
import 'constants/primary_color.dart';
import 'package:timely/utilities/get_primary_swatch.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // usePathUrlStrategy();

  runApp(const TimelyApp());
}

class TimelyApp extends StatelessWidget {
  const TimelyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(primaryColorCode),
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getPrimarySwatch(Color(primaryColorCode)))
              .copyWith(background: Colors.white)),
    );
  }
}
