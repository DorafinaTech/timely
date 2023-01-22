import 'package:flutter/material.dart';


import '../Components/top_modal_sheet.dart';

class MyFloatingModalBotton extends StatefulWidget {
  const MyFloatingModalBotton({Key? key}) : super(key: key);

  @override
  State<MyFloatingModalBotton> createState() => _MyFloatingModalBottonState();
}

class _MyFloatingModalBottonState extends State<MyFloatingModalBotton> {
  TextEditingController _control = TextEditingController();
  TextEditingController _controll = TextEditingController();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
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
                  padding:
                      EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Tittle',
                        hintStyle: TextStyle(color: Colors.grey)),
                    controller: _control,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Satoshi, color: Color(0xFFB3B3B3)'),
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 5, right: 16, left: 16, bottom: 20),
                    child: TextFormField(
                      controller: _controll,
                      decoration: InputDecoration(
                        hintText: 'Lecturer\'s name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFFB3B3B3)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 5, right: 16, left: 16, bottom: 20),
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Venue',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(
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
                Text(
                  'Start:',
                  style: TextStyle(
                      fontFamily: 'Satoshi', fontSize: 16, color: Colors.black),
                ),
                GestureDetector(
                  child: Text('Tue, 20 Jan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
                GestureDetector(
                  child: Text('11:00am',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('End:',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16,
                      color: Colors.black)),
              GestureDetector(
                child: Text('Tue, 20 Jan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 16,
                        color: Color(0xFF1C8E77))),
              ),
              GestureDetector(
                child: Text('12:00am',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 16,
                        color: Color(0xFF1C8E77))),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Image.asset(
                  'svgs/vec.png',
                ),
                height: 19,
              ),
              Text(
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
                             builder: (context)=> TopModalSheet());
                      },
                      child: Icon(
                        Icons.add,
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
