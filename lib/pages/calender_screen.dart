import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timely/components/bottom_nav.dart';

import '../components/popup_menu_buttons.dart';
import '../constants/menu_padding.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Jan 2023'),
        actions: [
          Row(
            children: [
              const MenuButton(
                mypopupcolor: Colors.white,
              ),
              Container(
                width: menuPadding,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                calendarStyle: const CalendarStyle(),
                weekNumbersVisible: false,
                headerVisible: true,
                daysOfWeekVisible: true,
                headerStyle: const HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.transparent)),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
