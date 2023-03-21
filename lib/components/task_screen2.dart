import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timely/controllers/reading_controller.dart';
import 'package:timely/utilities/route_paths.dart';

import '../models/reading_model.dart';
import '../utilities/show_snackbar.dart';

class TaskScreen2 extends StatefulWidget {
  const TaskScreen2({Key? key}) : super(key: key);

  @override
  State<TaskScreen2> createState() => _TaskScreen2();
}

class _TaskScreen2 extends State<TaskScreen2> {
  final TextEditingController _daysController = TextEditingController();
  final TextEditingController _coursesController = TextEditingController();
  final TextEditingController _readingController = TextEditingController();

  final ReadingController _getxReadingController =
      Get.put<ReadingController>(ReadingController());

  String mDate = "Choose Date";
  TimeOfDay? startInitialTime;

  // StartTime
  String sTime = "Choose Time";
  static const TimeOfDay starttime = TimeOfDay(hour: 10, minute: 30);
  // TimeOfDay mytime =   TimeOfDay();

  // EndTime
  String mTime = "Choose Time";
  TimeOfDay endtime = const TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Day',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              controller: _daysController,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
            )),

        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Course',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black),
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              controller: _coursesController,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
            )),

        Flexible(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          debugPrint(pickedDate
                              .toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              DateFormat('dd-MM-yyyy').format(pickedDate);

                          debugPrint(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            mDate =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      child: Text(mDate)),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Start Time:',
                            style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 16,
                                color: Colors.black),
                          ),
/*
                GestureDetector(
                  child: const Text('Tue, 20 Jan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 16,
                            color: Color(0xFF1C8E77))),
                ),
*/
                          TextButton(
                            child: Text(sTime,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: 16,
                                    color: Color(0xFF1C8E77))),
                            onPressed: () async {
                              {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: starttime,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true),
                                      child: child!,
                                    );
                                  },
                                );
                                if (newTime == null) return;

                                setState(() {
                                  newTime;

                                  sTime = newTime.toString();
                                  sTime = '${newTime.hour} : ${newTime.minute}';
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('End Time:',
                                style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: 16,
                                    color: Colors.black)),
/*
              GestureDetector(
                child: const Text('Tue, 20 Jan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
              ),
*/
                            TextButton(
                              child: Text(mTime,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 16,
                                      color: Color(0xFF1C8E77))),
                              onPressed: () async {
                                {
                                  {
                                    TimeOfDay? newTime = await showTimePicker(
                                      context: context,
                                      initialTime: endtime,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child!,
                                        );
                                      },
                                    );
                                    if (newTime == null) return;

                                    setState(() {
                                      endtime = newTime;

                                      mTime = newTime.toString();
                                      mTime =
                                          '${newTime.hour} : ${newTime.minute}';
                                    });
                                  }
                                }
                              },
                            ),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Container(
        //     padding: const EdgeInsets.only(right: 8),
        //     height: 19,
        //     child: Image.asset(
        //       'svgs/vec.png',
        //     ),
        //   ),
        //   const Text(
        //     '10 minutes Before',
        //     style: TextStyle(
        //       fontSize: 16,
        //       fontFamily: 'Satoshi',
        //       color: Color(0xFF03110E),
        //     ),
        //   ),
        //   Expanded(
        //       child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Container(
        //         padding: EdgeInsets.zero,
        //         child: TextButton(
        //           onPressed: () {
        //             showDialog(
        //                 context: context,
        //                 builder: (context) => const TopModalSheet());
        //           },
        //           child: Icon(Icons.add, color: Theme.of(context).primaryColor),
        //         ),
        //       ),
        //     ],
        //   ))
        // ]),
        // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Container(
        //     padding: const EdgeInsets.only(right: 8),
        //     height: 19,
        //     child: Image.asset(
        //       'svgs/dont repeat.png',
        //     ),
        //   ),
        //   const Text(
        //     'Dont repeat',
        //     style: TextStyle(
        //         fontSize: 16, fontFamily: 'Satoshi', color: Color(0xFF1C8E77)),
        //   ),
        // ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 30,
              margin: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 5),
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    margin:
                        const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ReadingModel readingModel = ReadingModel(
                          course: _readingController.text,
                          // venue: '',
                          date: mDate,
                          day: _daysController.text,
                          start_time: sTime,
                          // notification: 'false',
                          end_time: mTime,
                          // day: 'day',
                          // date: 'date',
                          // color: 'blue');
                          // color: 'blue',
                          // interval: 'true',);
                        );

                        addToFireBase(readingModel, context);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        minimumSize: const Size(double.infinity, 5),
                        backgroundColor: Colors.teal,
                        side: const BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void addToFireBase(ReadingModel readingModel, BuildContext context) {
    _getxReadingController.addToFirebase(readingModel, context);
  }
}
