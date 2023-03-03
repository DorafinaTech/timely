import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_modal_sheet.dart';
import 'package:timely/components/top_modal_sheet.dart';
import 'package:timely/controllers/form_controller.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final controller = FormController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (controller.showTop.value) const TopModalSheet(),
          if (controller.showBottom.value) const BottomModalSheet()
        ],
      )),
    );
  }
}
