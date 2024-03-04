// import 'dart:convert';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/components/task_screen2.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:intl/intl.dart';
import '../controllers/reading_controller.dart';
import 'package:timely/models/reading_model.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  var now = DateTime.now();
  var dateFormatter = DateFormat('yyyy-MM-dd');

  String todaysDate = '';
  final EventController<ReadingModel> _readingEventController =
      EventController<ReadingModel>();
  final ReadingController _readingController = ReadingController();

  @override
  void initState() {
    dateFormatter.format(now);
    super.initState();
  }

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
      body: StreamBuilder(
        stream: _readingController.getSnapshots(),
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

          List<CalendarEventData<ReadingModel>> eventsToBeAdded = [];

          for (var readingDoc in snapshot.data!.docs) {
            var readingMap = readingDoc.data();

            debugPrint(readingMap.toString());

            var readingModel =
                ReadingModel.fromJson(readingMap as Map<String, dynamic>);

            var dateArray = readingModel.date.split('-');

            var startTimeArray = readingModel.start_time
                .split(':')
                .map((e) => int.parse(e.trim()))
                .toList();

            var endTimeArray = readingModel.end_time
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

            var readingEvent = CalendarEventData<ReadingModel>(
                title: readingModel.course,
                date: startDate,
                startTime: startTime,
                event: readingModel,
                endTime: endTime);

            eventsToBeAdded.add(readingEvent);
          }

          _readingEventController.removeWhere((element) => true);
          _readingEventController.addAll(eventsToBeAdded);

          debugPrint('Events to be added: $eventsToBeAdded');

          return WeekView<ReadingModel>(
            controller: _readingEventController,
            onEventTap: (events, dateTime) => onEventTap(events, dateTime),
          );
        },
      ),
    );
  }

  //
  void onEventTap(
      List<CalendarEventData<ReadingModel>> events, DateTime dateTime) {
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
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }
  //
}
