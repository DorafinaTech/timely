import 'dart:convert';
NotesModel noteFromJson(String str) => NotesModel.fromJson(json.decode(str));

String noteToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  NotesModel({
    // this.id,
    required this.userID,
    required this.time,
    required this.title,
    required this.body,
    // required this.notification,
    // required this.venue,
    // required this.lecturerName,
  });

  // String? id;
  final String userID;
  final DateTime time;
  final String title;
  final String body;
  // final String body;
  // final String venue;
  // final String lecturerName;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    // id: json["id"],
    userID: json["userID"],
    time: json["time"],
    title: json["title"],
    body: json["body"],
    // notification: json["notification"],
    // venue: json["venue"],
    // lecturerName: json["lecturerName"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "userID": userID,
    "time": time,
    "title": title,
    "body": body,
    // "notification": notification,
    // "venue": venue,
    // "lecturerName": lecturerName,
  };
}
