import 'package:timely/controllers/auth_controller.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:calendar_view/calendar_view.dart';

class DeviceNotificationController extends BaseController {
  final AuthController _authController =
      Get.put<AuthController>(AuthController());

  Future<void> addToCalendar(
      {required String title,
      required String description,
      required String location,
      required DateTime startDate,
      required DateTime endDate}) async {
    var timeDifference = endDate.difference(startDate);

    final Event event = Event(
      title: title,
      description: description,
      location: location,
      startDate: startDate,
      endDate: endDate,
      iosParams: IOSParams(
        reminder: Duration(
            hours: timeDifference
                .inHours), // on iOS, you can set alarm notification after your event.
        url:
            'https://getreading_companion.com', // on iOS, you can set url to your event.
      ),
      androidParams: AndroidParams(
        emailInvites: [
          _authController.currentUser.value!.email!
        ], // on Android, you can add invite emails to your event.
      ),
    );

    await Add2Calendar.addEvent2Cal(event);

    // if (await FlutterAppBadger.isAppBadgeSupported()) {
    //   FlutterAppBadger.updateBadgeCount(1);
  }
}
