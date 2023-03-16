import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/new_exam_bottom_sheet.dart';
import 'package:timely/components/top_modal_sheet.dart';
import 'package:timely/controllers/test_form_controller.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final testFormController = Get.put<TestFormController>(TestFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (testFormController.showTop.value) const TopModalSheet(),
              if (testFormController.showBottom.value) const AddExamBottomSheet()
            ],
          )),
    );
  }
}
