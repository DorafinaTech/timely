import 'package:flutter/material.dart';

class BottomSheetwidget extends StatefulWidget {
  const BottomSheetwidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetwidget> createState() => _BottomSheetwidgetState();
}

class _BottomSheetwidgetState extends State<BottomSheetwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          const Text("Tittle"),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          const Text('Lecture\ns name'),
          const Spacer(),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          const Text('Venue')
        ],
      ),
    );
  }
}
