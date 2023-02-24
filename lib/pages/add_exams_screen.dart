import 'package:flutter/material.dart';
import 'package:timely/components/show_modal_buttom_sheet.dart';
import 'package:timely/components/top_modal_sheet.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TopModalSheet(), ShowModalButtomSheet()],
      ),
    );
  }
}
