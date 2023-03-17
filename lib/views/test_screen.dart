import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// import 'package:time_planner/time_planner.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/models/tests_model.dart';

import '../components/popup_menu_buttons.dart';
import '../components/new_exam_bottom_sheet.dart';
import '../constants/menu_padding.dart';
import '../controllers/test_controller.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var now = DateTime.now();

  var dateFormatter = DateFormat('yyyy-MM-dd');

  String todaysDate = '';
  final EventController _testEventController = EventController();
  final TestController _testController = TestController();

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
        // mini: true,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => const AddExamBottomSheet());
        },
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text('Tests Week view',
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
      body: StreamBuilder(
        stream: _testController.getSnapshots(),
    builder: (context, snapshot) {
    if (snapshot.hasError) {
    return const Center(
    child: Text("Unable to get Events"),
    );
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
    child: CircularProgressIndicator(),
    );
    }

    List<CalendarEventData<TestModel>> eventsToBeAdded = [];

    snapshot.data?.docs.forEach((testDoc) {
    var testMap = testDoc.data();
    if (kDebugMode) {
    debugPrint(testMap.toString());
    }

    var testModel =
    TestModel.fromJson(testMap as Map<String, dynamic>);

    var dateArray = testModel.date.split('-');

    var startTimeArray = testModel.start_time
        .split(':')
        .map((e) => int.parse(e.trim()))
        .toList();

    var endTimeArray = testModel.end_time
        .split(':')
        .map((e) => int.parse(e.trim()))
        .toList();

    var startDay = int.parse(dateArray[0]);
    var startMonth = int.parse(dateArray[1]);
    var startYear = int.parse(dateArray[2]);

    var startHour = startTimeArray[0];
    var startMinute = startTimeArray[1];

    var endHour = endTimeArray[0];
    var endMinute = endTimeArray[1];

    var startDate = DateTime(
    startYear, startMonth, startDay, startHour, startMinute);

    var startTime = startDate;

    var endTime = startDate.copyWith(hour: endHour, minute: endMinute);

    var testEvent = CalendarEventData<TestModel>(
    title: testModel.course_title,
    date: startDate,
    startTime: startTime,
    event: testModel,
    endTime: endTime);

    eventsToBeAdded.add(testEvent);
    });

    _testEventController.removeWhere((element) => true);
    _testEventController.addAll(eventsToBeAdded);

    return WeekView(
    controller: _testEventController,
    );
    },
    ),
    );
  }
}
