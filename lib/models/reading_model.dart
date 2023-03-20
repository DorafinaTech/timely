import 'dart:convert';

ReadingModel readingFromJson(String str) => ReadingModel.fromJson(json.decode(str));

String readingToJson(ReadingModel data) => json.encode(data.toJson());

class ReadingModel {
  ReadingModel({
    this.id,
    required this.day,
    required this.course,
    required this.date,
    required this.start_time,
    required this.end_time,
    // required this.color,
    // required this.interval,
    // required this.venue,
    // required this.lecturerName,
  });

  String? id;
  final String day;
  final String course;
  final String date;
  final String start_time;
  final String end_time;
  // final String color;
  // final String interval;
  // final String venue;
  // final String lecturerName;

  factory ReadingModel.fromJson(Map<String, dynamic> json) => ReadingModel(
    id: json["id"],
    course: json["course"],
    date: json["date"],
    start_time: json["start_time"],
    end_time: json["end_time"],
    day: json["day"],
    // color: json["color"],
    // interval: json["interval"],
    // venue: json["venue"],
    // lecturerName: json["lecturerName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course": course,
    "day": day,
    "date": date,
    "start_time": start_time,
    "end_time": end_time,
    // "color": color,
    // "interval": interval,
    // "venue": venue,
    // "lecturerName": lecturerName,
  };
}
