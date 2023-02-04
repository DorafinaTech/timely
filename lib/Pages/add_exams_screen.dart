import 'package:flutter/material.dart';
import 'package:timely/Components/top_modal_sheet.dart';
import 'package:timely/FloatingActionButton/my_floating_modal_button.dart';

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
        children: [
          Container(
            child: TopModalSheet(),
          ),
          Container(child: MyFloatingModalBotton())
        ],
      ),
    );
  }
}
