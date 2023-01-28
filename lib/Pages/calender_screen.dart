import 'package:flutter/material.dart';
import 'package:timetable_app/Components/bottom%20navigation.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Components/popup_menu _buttons.dart';
import '../Constants/menu_padding.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Jan 2023'),
        actions: [
          Row(
            children: [
              MenuButton(
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
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                calendarStyle: CalendarStyle(),
                weekNumbersVisible: false,
                headerVisible: true,
                daysOfWeekVisible: true,
                headerStyle: HeaderStyle(
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
