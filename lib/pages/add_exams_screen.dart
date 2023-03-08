import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_modal_sheet.dart';
import 'package:timely/components/top_modal_sheet.dart';
import 'package:timely/controllers/test_form_controller.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final authController = Get.put<TestFormController>(TestFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.fromSize(
      size: Size(Get.width, Get.height),
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              // if (authController.showTop.value) const
              TopModalSheet(),
              BottomModalSheet()
            ],
          )),
    ));
  }
}
