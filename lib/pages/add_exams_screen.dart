import 'package:flutter/material.dart';
import 'package:timely/floatingActionButton/show_modal_buttom_sheet.dart';

import '../components/show_modal_buttom_sheet.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({Key? key}) : super(key: key);

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ShowModalButtomSheet(
          ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [TopModalSheet(),
      //     ShowModalButtomSheet()],
      // ),
    );
  }
}
