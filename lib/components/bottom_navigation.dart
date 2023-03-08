import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/route_names.dart';
import 'package:timely/utilities/route_paths.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String currentRouteName = RouteNames.homeScreen;

  int currentRouteIndex = 0;

  Map<String, int> pagesListIndicies = {
    RoutePaths.homeScreen: 0,
    RoutePaths.examsScreen: 1,
    RoutePaths.testScreen: 2,
    RoutePaths.readingScreen: 3,
    RoutePaths.profileScreen: 4,
  };

  Map<int, String> pagesListNames = {
    0: RoutePaths.homeScreen,
    1: RoutePaths.examsScreen,
    2: RoutePaths.testScreen,
    3: RoutePaths.readingScreen,
    4: RoutePaths.profileScreen,
  };

  void setCurrentIndex(int index) {
    setState(() {
      currentRouteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    if (route != null) {
      currentRouteName = route.settings.name!;

      setCurrentIndex(pagesListIndicies[currentRouteName] ?? 0);
    }

    return Hero(
        tag: 'bottom_navigation',
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black54,
          // unselectedItemColor: Color(0xFFB3B3B3),
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (index) {
            setCurrentIndex(index);

            if (route != null) {
              if (currentRouteName != pagesListNames[currentRouteIndex]) {
                Get.toNamed(
                    pagesListNames[currentRouteIndex] ?? RoutePaths.homeScreen);
              }
            }
          },
          currentIndex: currentRouteIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rate_review,
              ),
              label: 'Exams',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mode_edit,
              ),
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_stories,
              ),
              label: 'Reading',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ],
        ));
  }
}
