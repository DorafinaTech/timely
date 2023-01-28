import 'package:flutter/material.dart';

class BottomNavigation  extends StatefulWidget {
  const BottomNavigation ({Key? key}) : super(key: key);

  @override
  State<BottomNavigation > createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation > {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black54,
      selectedItemColor: Theme.of(context).primaryColor,

      onTap: (index) {

      },
      currentIndex: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.rate_review,
            color: Color(0xFFB3B3B3),
          ),
          label: 'Exams',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_edit, color: Color(0xFFB3B3B3)),
          label: 'Test',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_stories, color: Color(0xFFB3B3B3)),
          label: 'Reading',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color(0xFFB3B3B3)),
          label: 'Profile',
        ),
      ],
    );
  }
}
