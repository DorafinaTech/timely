import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/pages/add_exams_screen.dart';


import '../components/bottom_modal_sheet.dart';
import '../constants/menu_padding.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExamScreen()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Week view',
            style: TextStyle(
                fontFamily: 'Satoshi', fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          Row(children: [
            const MenuButton(
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
        tasks: const [

        ],
      ),
    );
  }
}
