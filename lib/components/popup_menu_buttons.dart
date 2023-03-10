import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/utilities/route_paths.dart';
import 'package:timely/views/about.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.popupColor}) : super(key: key);

  final Color popupColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int index) {
        String nextPage = RoutePaths.calendarScreen;
        switch (index) {
          case 0:
            nextPage = RoutePaths.calendarScreen;
            break;
          case 1:
            nextPage = RoutePaths.notescreen;
            break;
          case 2:
            nextPage = RoutePaths.aboutscreen;
            break;
        }

        Get.toNamed(nextPage);
      },
      padding: const EdgeInsets.only(
        right: 200,
      ),
      color: const Color(0xFFEEFCF9),
      position: PopupMenuPosition.over,
      offset: const Offset(0, 0),
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          padding: const EdgeInsets.all(10.5),
          value: 0,
          // row has two child icon and text.
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
              const SizedBox(
                // sized box with width 10
                width: 10,
              ),
              const Text("Calender")
            ],
          ),
        ),
        // popupmenu item 2
        PopupMenuItem(
          padding: const EdgeInsets.all(10.5),
          value: 1,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(Icons.sticky_note_2, color: Theme.of(context).primaryColor),
              const SizedBox(
                // sized box with width 10
                width: 10,
              ),
              const Text("Notes")
            ],
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.all(10.5),
          value: 2,
          // row has two child icon and text
          child: Row(children: [
            Icon(Icons.tag_faces, color: Theme.of(context).primaryColor),
            const SizedBox(
              // sized box with width 10
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const About(),
                      ));
                },
                child: const Text("About",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Satoshi'))),
          ]),
        ),
      ],
      elevation: 2,
      child: Icon(
        Icons.menu,
        color: popupColor,
      ),
    );
  }
}
