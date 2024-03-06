import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timely/controllers/reading_controller.dart';
import 'package:timely/models/reading_model.dart';

class TaskScreen2 extends StatefulWidget {
  const TaskScreen2({Key? key}) : super(key: key);

  @override
  State<TaskScreen2> createState() => _TaskScreen2();
}

class _TaskScreen2 extends State<TaskScreen2> {
  final TextEditingController _coursesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ReadingController _getxReadingController =
      Get.put<ReadingController>(ReadingController());

  String mDate = "Choose Date";
  TimeOfDay? startInitialTime;

  // StartTime
  String sTime = "Choose Time";
  static TimeOfDay starttime = TimeOfDay.now();

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
      child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Course',
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: _coursesController,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
                    )),
                Flexible(
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
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                debugPrint(pickedDate.toString());
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                debugPrint(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  mDate =
                                      formattedDate; //set output date to TextFormField value.
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
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        true),
                                            child: child!,
                                          );
                                        },
                                      );
                                      if (newTime == null) return;

                                      setState(() {
                                        newTime;

                                        sTime = newTime.toString();
                                        sTime =
                                            '${newTime.hour} : ${newTime.minute}';
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          TimeOfDay? newTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: endtime,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return MediaQuery(
                                                data: MediaQuery.of(context)
                                                    .copyWith(
                                                        alwaysUse24HourFormat:
                                                            true),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      margin: const EdgeInsets.only(
                          top: 20.0, left: 8.0, right: 8.0),
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
                            margin: const EdgeInsets.only(
                                top: 20.0, left: 8.0, right: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ReadingModel readingModel = ReadingModel(
                                    course: _coursesController.text,
                                    date: mDate,
                                    start_time: sTime,
                                    end_time: mTime,
                                  );

                                  addToFireBase(readingModel, context);
                                }
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
              ])),
    );
  }

  void addToFireBase(ReadingModel readingModel, BuildContext context) {
    _getxReadingController.addToFirebase(readingModel, context);
  }
}
