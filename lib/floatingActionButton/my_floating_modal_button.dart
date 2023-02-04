import 'package:flutter/material.dart';

import '../components/top_modal_sheet.dart';

class MyFloatingModalBotton extends StatefulWidget {
  const MyFloatingModalBotton({Key? key}) : super(key: key);

  @override
  State<MyFloatingModalBotton> createState() => _MyFloatingModalBottonState();
}

class _MyFloatingModalBottonState extends State<MyFloatingModalBotton> {
  final TextEditingController _control = TextEditingController();
  final TextEditingController _controll = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, right: 16, left: 16, bottom: 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Tittle',
                        hintStyle: TextStyle(color: Colors.grey)),
                    controller: _control,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, right: 16, left: 16, bottom: 20),
                    child: TextFormField(
                      controller: _controll,
                      decoration: const InputDecoration(
                        hintText: 'Lecturer\'s name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFFB3B3B3)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, right: 16, left: 16, bottom: 20),
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Venue',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Satoshi',
                          color: Color(0xFFB3B3B3)),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
          ]),
    );
  }
}
