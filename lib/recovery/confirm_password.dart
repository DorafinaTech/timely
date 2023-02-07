import 'package:flutter/material.dart';
import 'package:timely/pages/home_screen.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Recover Password',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: " New Password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.teal.shade200,
                          width: 1.5,
                          style: BorderStyle.solid)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.teal.shade200,
                          width: 1.5,
                          style: BorderStyle.solid)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 50,left: 8, right: 8),
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
                        60,
                      ),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: Colors.teal,
                  side:  BorderSide(
                    color: Colors.teal,
                  ),
                ),
                child: Text(
                  'Proceed',
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
    );
  }
}
