import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/pages/exam_screen.dart';
import 'package:timely/pages/notes.dart';
import 'package:timely/pages/calender_screen.dart';
import 'package:timely/components/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final authController = Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const MenuButton(
                mypopupcolor: Colors.black,
              ),
              Container(
                width: menuPadding,
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Expanded(
          child: ListView(children: [
            ListTile(
              leading: ClipOval(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/thessC.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                'Hey, ${authController.currentUser?.displayName!}',
                style: const TextStyle(fontFamily: 'Satohi', fontSize: 16),
              ),
              subtitle: const Text( 
                'lets get things Scheduled, shall we?',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14,
                ),
              ),
              tileColor: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFEEFCF9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: const Icon(
                  Icons.calendar_today,
                  size: 50,
                  color: Color(0xFF1C8E77),
                ),
                selectedColor: Theme.of(context).primaryColor,
                title: const Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalenderScreen(),
                    ),
                  );
                },
                subtitle: const Text(
                  'Thursady 5th January 2023',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: const Icon(
                  Icons.weekend,
                  size: 50,
                  color: Color(0xFFFF5D5A),
                ),
                title: const Text(
                  'Week Review',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ExamScreen(),
                    ),
                  );
                },
                subtitle: const Text(
                  'Scheduled set for the week',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFEEFCF9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                trailing: const Icon(
                  Icons.note_add,
                  size: 50,
                  color: Color(0xFF1C8E77),
                ),
                title: const Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notes(),
                    ),
                  );
                },
                subtitle: const Text(
                  'Save your thoughts',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
