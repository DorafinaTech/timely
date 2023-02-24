import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:timely/firebase_options.dart';
import 'package:timely/pages/login.dart';
import 'package:timely/pages/edit_profile_screen.dart';
import 'package:timely/pages/exam_screen.dart';
import 'package:timely/pages/home_screen.dart';
import 'package:timely/pages/onboarding.dart';
import 'package:timely/pages/onboarding1.dart';
import 'package:timely/pages/onboarding2.dart';
import 'package:timely/pages/profile_screen.dart';
import 'package:timely/pages/reading_screen.dart';
import 'package:timely/pages/register.dart';
import 'package:timely/pages/splash_screen.dart';
import 'package:timely/pages/test_screen.dart';
import 'package:timely/utilities/route_names.dart';
import 'package:timely/utilities/route_paths.dart';
import 'constants/primary_color.dart';
import 'package:timely/utilities/get_primary_swatch.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TimelyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.splash,
      name: RoutePaths.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.homeScreen,
      name: RouteNames.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.onboarding1,
      name: RouteNames.onboarding1,
      builder: (BuildContext context, GoRouterState state) {
        return const Onboarding1();
      },
    ),GoRoute(
      path: RoutePaths.onboarding2,
      name: RouteNames.onboarding2,
      builder: (BuildContext context, GoRouterState state) {
        return const Onboarding();
      },
    ),
    // GoRoute(
    //   path: RoutePaths.onboarding3,
    //   name: RouteNames.onboarding3,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const Onboarding();
    //   },
    // ),
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: RoutePaths.examsScreen,
      name: RouteNames.examsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ExamScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.testScreen,
      name: RouteNames.testScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const TestScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.readingScreen,
      name: RouteNames.readingScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ReadingScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.profileScreen,
      name: RouteNames.profileScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.editProfileScreen,
      name: RouteNames.editProfileScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const EditProfileScreen();
      },
    ),
  ],
);

class TimelyApp extends StatelessWidget {
  const TimelyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Timely ',

      // routerConfig: _router,

      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,

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
