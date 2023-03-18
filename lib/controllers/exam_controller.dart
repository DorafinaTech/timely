import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/models/exams_model.dart';
import 'package:timely/utilities/show_snackbar.dart';

class ExamController extends BaseController {
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

      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(Get.context!);
      });
    });
  }

  Stream<QuerySnapshot> getSnapshots() {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }
}
