import 'dart:convert';

TestsModel testFromJson(String str) => TestsModel.fromJson(json.decode(str));

String testToJson(TestsModel data) => json.encode(data.toJson());

class TestsModel {
  TestsModel({
    this.id,
    required this.course_title,
    required this.date,
    required this.start_time,
    required this.end_time,
    required this.color,
    required this.notification,
    required this.venue,
    required this.lecturerName,
  });

  String? id;
  final String course_title;
  final String date;
  final String start_time;
  final String end_time;
  final String color;
  final String notification;
  final String venue;
  final String lecturerName;

  factory TestsModel.fromJson(Map<String, dynamic> json) => TestsModel(
    id: json["id"],
    course_title: json["course_title"],
    date: json["date"],
    start_time: json["start_time"],
    end_time: json["end_time"],
    color: json["color"],
    notification: json["notification"],
    venue: json["venue"],
    lecturerName: json["lecturerName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_title": course_title,
    "date": date,
    "start_time": start_time,
    "end_time": end_time,
    "color": color,
    "notification": notification,
    "venue": venue,
    "lecturerName": lecturerName,
  };
}
