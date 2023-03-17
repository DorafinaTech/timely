import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/components/task_screen2.dart';
import 'package:timely/constants/menu_padding.dart';

class ReadingScreen extends StatelessWidget {
  ReadingScreen({Key? key}) : super(key: key);

  final EventController _readingEventController = EventController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      appBar: AppBar(
        title: const Center(
          child: Text(' Reading Week view',
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          Row(children: [
            const MenuButton(
              popupColor: Colors.white,
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        // mini: true,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => const TaskScreen2());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: WeekView(
        controller: _readingEventController,
      ),
    );
  }
}
