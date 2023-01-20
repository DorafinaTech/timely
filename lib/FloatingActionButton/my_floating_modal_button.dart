import 'package:flutter/material.dart';
import 'package:timetable_app/FloatingActionButton/bottomsheet_%20widget.dart';

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
                          top: 5, right: 16, left: 16, bottom: 50),
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
                          top: 5, right: 16, left: 16, bottom: 50),
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
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, right: 16, left: 16, bottom: 0),
                    child: Text(
                      'Start:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    child: Text('Tue, 20 Jan',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 20,
                            color: Color(0xFF1C8E77))),
                  ),
                  GestureDetector(
                    child: Text('11:00am',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 20,
                            color: Color(0xFF1C8E77))),
                  )
                ],
              ),
              Row(children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text('End:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Colors.black)),
                ),
                GestureDetector(
                  child: Text('Tue, 20 Jan',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
                GestureDetector(
                  child: Text('12:00am',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          color: Color(0xFF1C8E77))),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('svgs/vec(1).png')
                      // height: 5,
                      // width: 5,
                    ),
                  Text(
                    '10 minutes Before',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF03110E),
                    ),
                  ),
                ],
              ),

                ]
        ),
    );

  }
}
