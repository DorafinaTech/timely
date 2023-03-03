import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:timely/firebase_options.dart';
import 'package:timely/pages/calender_screen.dart';
import 'package:timely/pages/edit_profile_screen.dart';
import 'package:timely/pages/exam_screen.dart';
import 'package:timely/pages/home_screen.dart';
import 'package:timely/pages/login.dart';
import 'package:timely/pages/notes.dart';
import 'package:timely/pages/onboarding.dart';
import 'package:timely/pages/onboarding1.dart';
import 'package:timely/pages/onboarding2.dart';
import 'package:timely/pages/profile_screen.dart';
import 'package:timely/pages/reading_screen.dart';
import 'package:timely/pages/register.dart';
import 'package:timely/pages/splash_screen.dart';
import 'package:timely/pages/test_screen.dart';
import 'package:timely/utilities/get_primary_swatch.dart';
import 'package:timely/utilities/route_names.dart';
import 'package:timely/utilities/route_paths.dart';

import 'constants/primary_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TimelyApp());
}

class TimelyApp extends StatelessWidget {
  const TimelyApp({Key? key}) : super(key: key);

  final splashScreen = const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timely',
      initialRoute: RoutePaths.splash,
      getPages: [
        GetPage(
          title: RouteNames.splash,
          name: RoutePaths.splash,
          page: () => splashScreen,
        ),
        GetPage(
          title: RouteNames.onboarding1,
          name: RoutePaths.onboarding1,
          page: () => const Onboarding1(),
        ),
        GetPage(
          title: RouteNames.onboarding2,
          name: RoutePaths.onboarding2,
          page: () => const Onboarding2(),
        ),
        GetPage(
          name: RoutePaths.onboarding3,
          title: RouteNames.onboarding3,
          page: () {
            return const Onboarding();
          },
        ),
        GetPage(
          name: RoutePaths.homeScreen,
          title: RouteNames.homeScreen,
          page: () {
            return const HomeScreen();
          },
        ),
        GetPage(
          name: RoutePaths.login,
          title: RouteNames.login,
          page: () {
            return const Login();
          },
        ),
        GetPage(
          name: RoutePaths.register,
          title: RouteNames.register,
          page: () {
            return const Register();
          },
        ),
        GetPage(
          name: RoutePaths.examsScreen,
          title: RouteNames.examsScreen,
          page: () {
            return const ExamScreen();
          },
        ),
        GetPage(
          name: RoutePaths.testScreen,
          title: RouteNames.testScreen,
          page: () {
            return const TestScreen();
          },
        ),
        GetPage(
          name: RoutePaths.readingScreen,
          title: RouteNames.readingScreen,
          page: () {
            return const ReadingScreen();
          },
        ),
        GetPage(
          name: RoutePaths.profileScreen,
          title: RouteNames.profileScreen,
          page: () {
            return const ProfileScreen();
          },
        ),
        GetPage(
          name: RoutePaths.editProfileScreen,
          title: RouteNames.editProfileScreen,
          page: () {
            return const EditProfileScreen();
          },
        ),
        GetPage(
          name: RoutePaths.calendersreen,
          title: RouteNames.calenderscreen,
          page: () {
            return const CalenderScreen();
          },
        ),
        GetPage(
          name: RoutePaths.notescreen,
          title: RouteNames.notescreen,
          page: () {
            return const Notes();
          },
        ),
      ],
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(primaryColorCode),
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getPrimarySwatch(Color(primaryColorCode)))
              .copyWith(background: Colors.white)),
      themeMode: ThemeMode.light,
    );
  }
}
