import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timely/utilities/route_names.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String currentRouteName = RouteNames.homeScreen;

  int currentRouteIndex = 0;

  Map<String, int> pagesListIndicies = {
    RouteNames.homeScreen: 0,
    RouteNames.examsScreen: 1,
    RouteNames.testScreen: 2,
    RouteNames.readingScreen: 3,
    RouteNames.profileScreen: 4,
  };

  Map<int, String> pagesListNames = {
    0: RouteNames.homeScreen,
    1: RouteNames.examsScreen,
    2: RouteNames.testScreen,
    3: RouteNames.readingScreen,
    4: RouteNames.profileScreen,
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

      setCurrentIndex(pagesListIndicies[currentRouteName]!);
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
                context.goNamed(pagesListNames[currentRouteIndex]!);
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
