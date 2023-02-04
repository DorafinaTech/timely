import 'package:flutter/material.dart';
import 'package:timely/components/top_modal_sheet.dart';
import 'package:timely/floatingActionButton/my_floating_modal_button.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [TopModalSheet(), MyFloatingModalBotton()],
      ),
    );
  }
}
