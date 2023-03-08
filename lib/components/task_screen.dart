import 'package:flutter/material.dart';
import 'package:timely/views/home_screen.dart';

import '../components/top_modal_sheet.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreen();
}

class _TaskScreen extends State<TaskScreen> {
  final TextEditingController _control = TextEditingController();
  final TextEditingController _controll = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextField(
                  decoration:  InputDecoration(
                      labelText: 'Tittle',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  controller: _control,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
                )),

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10,10,10,10),
                    child: TextField(
                      controller: _controll,
                      decoration: const InputDecoration(
                        labelText: 'Lecturer\'s name',
                        hintStyle: TextStyle(color: Colors.grey,fontFamily: "satoshi", fontSize: 16),
                        ),
                      ),
                      ),
                    ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10,10,10,10),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Venue',
                        hintStyle: TextStyle(color: Colors.grey,fontFamily: "satoshi", fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Start:',
                  style: TextStyle(
                      fontFamily: 'Satoshi', fontSize: 16, color: Colors.black),
                ),
                GestureDetector(
                  child: const Text('Tue, 20 Jan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
                GestureDetector(
                  child: const Text('11:00am',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('End:',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16,
                      color: Colors.black)),
              GestureDetector(
                child: const Text('Tue, 20 Jan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 16,
                        color: Color(0xFF1C8E77))),
              ),
              GestureDetector(
                child: const Text('12:00am',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 16,
                        color: Color(0xFF1C8E77))),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                height: 19,
                child: Image.asset(
                  'svgs/vec.png',
                ),
              ),
              const Text(
                '10 minutes Before',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Satoshi',
                  color: Color(0xFF03110E),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const TopModalSheet());
                      },
                      child: Icon(Icons.add,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                height: 19,
                child: Image.asset(
                  'svgs/dont repeat.png',
                ),
              ),
              const Text(
                'Dont repeat',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                    color: Color(0xFF1C8E77)),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 30,
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      minimumSize: const Size(double.infinity, 5),
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 30,
                        margin: const EdgeInsets.only(
                            top: 20.0, left: 8.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  HomeScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            minimumSize: const Size(double.infinity, 5),
                            backgroundColor: Colors.teal,
                            side: const BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ]),
    );
  }
}
