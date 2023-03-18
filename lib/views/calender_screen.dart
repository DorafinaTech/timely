import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/components/bottom_navigation.dart';
import 'package:timely/components/popup_menu_buttons.dart';
import 'package:timely/constants/menu_padding.dart';
import 'package:timely/utilities/route_paths.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  final EventController _monthEventController = EventController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // mini: true,
        shape: const CircleBorder(),
        onPressed: () {
          Get.bottomSheet(
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Get.theme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          enableFeedback: true,
                          splashColor: Colors.white,
                          title: const Center(
                              child: Text(
                            'Add Exam',
                            style: TextStyle(color: Colors.white),
                          )),
                          onTap: () {
                            Get.toNamed(RoutePaths.examsScreen);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: Get.theme.primaryColor,
                        child: ListTile(
                          enableFeedback: true,
                          splashColor: Colors.white,
                          title: const Center(
                              child: Text('Add Test',
                                  style: TextStyle(color: Colors.white))),
                          onTap: () {
                            Get.toNamed(RoutePaths.testScreen);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: Get.theme.primaryColor,
                        child: ListTile(
                          enableFeedback: true,
                          splashColor: Colors.white,
                          title: const Center(
                              child: Text('Add Reading',
                                  style: TextStyle(color: Colors.white))),
                          onTap: () {
                            Get.toNamed(RoutePaths.readingScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavigation(),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calendar',
            style: TextStyle(
                fontFamily: 'Satoshi', fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          Row(children: [
            const MenuButton(
              popupColor: Colors.white,
            ),
            Container(
              width: menuPadding,
            )
          ]),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: MonthView(
          controller: _monthEventController,
        ),
      ),
    );
  }
}
