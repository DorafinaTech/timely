import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:timely/views/home_screen.dart';

class OtpNumber extends StatefulWidget {
  const OtpNumber({Key? key}) : super(key: key);

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Recover Password',
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Enter the OTP we have sent to your mobile phone 08147318488 ",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Center(
                child: OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: const TextStyle(fontSize: 20),
                  onChanged: (pin) {
                    if (kDebugMode) {
                      print("Changed: $pin");
                    }
                  },
                  onCompleted: (pin) {
                    if (kDebugMode) {
                      print("Completed: $pin");
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didnt get the code?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Resend code',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 50, left: 8, right: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
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
                    side: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  child: const Text(
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
        ));
  }
}
