import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'package:timetable_app/Components/popup_menu _buttons.dart';
import 'package:timetable_app/FloatingActionButton/my_floating_modal_button.dart';
import 'package:timetable_app/Pages/add_exams_screen.dart';

import '../Constants/menu_padding.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExamScreen()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          Row(children: [
            MenuButton(
              mypopupcolor: Colors.white,
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        elevation: 0,
      ),
      body: TimePlanner(
        startHour: 6,
        endHour: 23,
        style: TimePlannerStyle(
          // cellHeight: 60,
          // cellWidth: 60,
          showScrollBar: true,
        ),
        headers: const [
          TimePlannerTitle(
            date: "3/10/2021",
            title: "Sunday",
          ),
          TimePlannerTitle(
            date: "3/11/2021",
            title: "Monday",
          ),
          TimePlannerTitle(
            date: "3/12/2021",
            title: "Tuesday",
          ),
          TimePlannerTitle(
            date: "3/13/2021",
            title: "Wednesday",
          ),
          TimePlannerTitle(
            date: "3/14/2021",
            title: "Thursday",
          ),
          TimePlannerTitle(
            date: "3/15/2021",
            title: "Friday",
          ),
          TimePlannerTitle(
            date: "3/16/2021",
            title: "Saturday",
          ),
        ],
        tasks: [],
      ),
    );
  }
}
