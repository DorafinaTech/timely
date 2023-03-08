// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ExamsModel examFromJson(String str) => ExamsModel.fromJson(json.decode(str));

String examToJson(ExamsModel data) => json.encode(data.toJson());

class ExamsModel {
  ExamsModel({
    this.id,
    required this.course_title,
    required this.day,
    required this.start_time,
    required this.end_time,
    required this.color,
    required this.notification,
  });

  String? id;
  final String course_title;
  final String day;
  final String start_time;
  final String end_time;
  final String color;
  final String notification;

  factory ExamsModel.fromJson(Map<String, dynamic> json) => ExamsModel(
        id: json["id"],
        course_title: json["course_title"],
        day: json["day"],
        start_time: json["start_time"],
        end_time: json["end_time"],
        color: json["color"],
        notification: json["notification"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_title": course_title,
        "day": day,
        "start_time": start_time,
        "end_time": end_time,
        "color": color,
        "notification": notification,
      };
}
