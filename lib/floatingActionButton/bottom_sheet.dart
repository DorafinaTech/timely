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
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const <Widget>[
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          Text("Tittle"),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          Text('Lecture\ns name'),
          Spacer(),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black54,
            ),
          ),
          Text('Venue')
        ],
      ),
    );
  }
}
