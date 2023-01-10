import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'package:timetable_app/Components/bottom_nav.dart';


class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

      title: Text('Week Review'),
      backgroundColor: Theme.of(context).primaryColor),
      // bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: TimePlanner(
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
              title: "sunday",
            ),
            TimePlannerTitle(
                date: "3/11/2021",
                title: "Monday"
            ),
            TimePlannerTitle(
              date: "3/12/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "3/13/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "3/14/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/15/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/16/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/17/2021",
              title: "sunday",
            ),
            TimePlannerTitle(
              date: "3/18/2021",
              title: "monday",
            ),
            TimePlannerTitle(
              date: "3/19/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "3/20/2021",
              title: "Wednesday",
            ),
            TimePlannerTitle(
              date: "3/21/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/22/2021",

              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/24/2021",
              title: "tuesday",
            ),
            TimePlannerTitle(
              date: "3/25/2021",
              title: "wednesday",
            ),
            TimePlannerTitle(
              date: "3/26/2021",
              title: "thursday",
            ),
            TimePlannerTitle(
              date: "3/27/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/28/2021",
              title: "saturday",
            ),
            TimePlannerTitle(
              date: "3/29/2021",
              title: "friday",
            ),
            TimePlannerTitle(
              date: "3/30/2021",
              title: "saturday",
            ),
          ],
          tasks: [],
      ),
    ),
    );
  }
}
