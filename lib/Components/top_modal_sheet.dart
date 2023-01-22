import 'package:flutter/material.dart';


class TopModalSheet extends StatelessWidget {
  const TopModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 19),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle_icon.png',
                  // height: 20,width: 20,),
                ),
              ),
              title: Text(
                'At time of event',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '5 minute Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '10 minute Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '15 minute Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '20 minute Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '30 minute Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'svgs/circle.png',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text(
                '1 hour Before',
                style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 16,
                    fontFamily: 'Satoshi'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontFamily: 'Satoshi'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Satoshi',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
