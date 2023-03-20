import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:timely/controllers/base_controller.dart';
import '../models/reading_model.dart';
import '../utilities/show_snackbar.dart';

class ReadingController extends BaseController {
  @override
  String get collectionName => 'readingSchedule';

  Future<void> addToFirebase(
      ReadingModel readingModel, BuildContext context) async {
    final readingRef =
        FirebaseFirestore.instance.collection(collectionName).doc();

    readingModel.id = readingRef.id;
    final data = readingModel.toJson();
    readingRef.set(data).whenComplete(() {
      log('reading inserted');

      showSnackbar('Successful', 'your Task has been added successfully');

      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(context);
      });
    });
  }

  Stream<QuerySnapshot> getSnapshots() {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }
}
