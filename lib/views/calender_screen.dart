import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  final EventController _monthEventController = EventController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calendar',
            style: TextStyle(
                fontFamily: 'Satoshi', fontSize: 20, color: Colors.white),
          ),
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
      body: SafeArea(
        child: MonthView(
          controller: _monthEventController,
        ),
      ),
    );
  }
}
