import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/new_exam_bottom_sheet.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/controllers/exam_controller.dart';
import 'package:timely/models/exams_model.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  var now = DateTime.now();
  var dateFormatter = DateFormat('yyyy-MM-dd');

  String todaysDate = '';

  final EventController<ExamsModel> _examEventController =
      EventController<ExamsModel>();

  final ExamController _examController = ExamController();

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
              // isScrollControlled: true,
              builder: (BuildContext context) => const AddExamBottomSheet());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Exams Week view',
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
      body: StreamBuilder(
        stream: _examController.getSnapshots(),
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

          List<CalendarEventData<ExamsModel>> eventsToBeAdded = [];

          snapshot.data?.docs.forEach((examDoc) {
            var examMap = examDoc.data();
            if (kDebugMode) {
              debugPrint(examMap.toString());
            }

            var examModel =
                ExamsModel.fromJson(examMap as Map<String, dynamic>);

            var dateArray = examModel.date.split('-');

            var startTimeArray = examModel.start_time
                .split(':')
                .map((e) => int.parse(e.trim()))
                .toList();

            var endTimeArray = examModel.end_time
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

            var examEvent = CalendarEventData<ExamsModel>(
                title: examModel.course_title,
                date: startDate,
                startTime: startTime,
                event: examModel,
                endTime: endTime);

            eventsToBeAdded.add(examEvent);
          });

          _examEventController.removeWhere((element) => true);
          _examEventController.addAll(eventsToBeAdded);

          return WeekView<ExamsModel>(
            startDay: WeekDays.sunday,
            initialDay: DateTime.now(),
            minDay: DateTime.now(),
            controller: _examEventController,
            onEventTap: (events, dateTime) {
              onEventTap(events, dateTime);
            },
          );
        },
      ),
    );
  }

  void onEventTap(
      List<CalendarEventData<ExamsModel>> events, DateTime dateTime) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(20),
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...events.map((e) => Card(
                    color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Title: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                e.title,
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Date: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                e.event!.date.toString(),
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Start time: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                e.event!.start_time.toString(),
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'End time: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                e.event!.end_time.toString(),
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Lecturer name: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                e.event!.lecturerName,
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }
}
