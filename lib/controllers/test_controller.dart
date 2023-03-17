import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/models/tests_model.dart';
import '../utilities/show_snackbar.dart';

class TestController extends BaseController {
  final String collectionName = 'testSchedule';

  Future<void> addToFirebase(TestModel testModel, BuildContext context) async {
    final testsRef =
    FirebaseFirestore.instance.collection(collectionName).doc();

    testModel.id = testsRef.id;
    final data = testModel.toJson();
    testsRef.set(data).whenComplete(() {
      log('test inserted');

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
