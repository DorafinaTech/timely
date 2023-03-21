import 'dart:convert';

ReadingModel readingFromJson(String str) =>
    ReadingModel.fromJson(json.decode(str));

String readingToJson(ReadingModel data) => json.encode(data.toJson());

class ReadingModel {
  ReadingModel({
    this.id,
    // required this.day,
    required this.course,
    required this.date,
    required this.start_time,
    required this.end_time,
  });

  String? id;
  // final String day;
  final String course;
  final String date;
  final String start_time;
  final String end_time;

  factory ReadingModel.fromJson(Map<String, dynamic> json) => ReadingModel(
        id: json["id"],
        // day: json['day'],
        course: json['course'],
        date: json['date'],
        start_time: json['start_time'],
        end_time: json['end_time'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "day": day,
        "course": course,
        "date": date,
        "start_time": start_time,
        "end_time": end_time,
      };
}
