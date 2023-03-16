import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:time_planner/time_planner.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/components/new_exam_bottom_sheet.dart';
import 'package:timely/constants/menu_padding.dart';

class ExamScreen extends StatefulWidget {
  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  var now = DateTime.now();
  var dateFormatter = DateFormat('yyyy-MM-dd');

  String todaysDate = '';
  final EventController _examEventController = EventController();

  @override
  void initState() {
    dateFormatter.format(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              // isScrollControlled: true,
              builder: (BuildContext context) => const AddExamBottomSheet());
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
              popupColor: Colors.white,
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        elevation: 0,
      ),
      body: WeekView(
        controller: _examEventController,
      ),
    );
  }
}
