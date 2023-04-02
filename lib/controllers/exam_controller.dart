import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/models/exams_model.dart';
import 'package:timely/utilities/show_snackbar.dart';
import 'package:timely/controllers/device_calendar_controller.dart';

class ExamController extends BaseController {
  final DeviceNotificationController _deviceNotificationController =
      Get.put<DeviceNotificationController>(DeviceNotificationController());

  @override
  String get collectionName => 'examSchedule';

  Future<void> addToFirebase(ExamsModel examModel, BuildContext context) async {
    final examsRef =
        FirebaseFirestore.instance.collection(collectionName).doc();

    examModel.id = examsRef.id;
    final data = examModel.toJson();
    examsRef.set(data).whenComplete(() {
      log('exams inserted');

      showSnackbar('Successful', 'your Task has been added successfully');

      _deviceNotificationController.addToCalendar(
          title: examModel.course_title,
          description: examModel.lecturerName,
          location: examModel.venue,
          startDate: DateTime.parse(examModel.start_time),
          endDate: DateTime.parse(examModel.end_time));

      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(Get.context!);
      });
    });
  }

  Stream<QuerySnapshot> getSnapshots() {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }
}
