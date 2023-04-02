import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/controllers/device_calendar_controller.dart';
import 'package:timely/models/tests_model.dart';
import '../utilities/show_snackbar.dart';

class TestController extends BaseController {
  final DeviceNotificationController _deviceNotificationController =
      Get.put<DeviceNotificationController>(DeviceNotificationController());

  @override
  String get collectionName => 'testSchedule';

  Future<void> addToFirebase(TestModel testModel, BuildContext context) async {
    final testsRef =
        FirebaseFirestore.instance.collection(collectionName).doc();

    testModel.id = testsRef.id;
    final data = testModel.toJson();

    testsRef.set(data).whenComplete(() {
      log('test inserted');

      showSnackbar('Successful', 'your Task has been added successfully');

      _deviceNotificationController.addToCalendar(
          title: testModel.course_title,
          description: testModel.lecturerName,
          location: testModel.venue,
          startDate: DateTime.parse(testModel.start_time),
          endDate: DateTime.parse(testModel.end_time));

      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(Get.context!);
      });
    });
  }

  Stream<QuerySnapshot> getSnapshots() {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }
}
