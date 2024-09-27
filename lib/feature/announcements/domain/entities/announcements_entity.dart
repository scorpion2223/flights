// To parse this JSON data, do
//
//     final announcementsEntity = announcementsEntityFromJson(jsonString);

import 'dart:convert';


String announcementsEntityToJson(AnnouncementsEntity data) => json.encode(data.toJson());

abstract class AnnouncementsEntity {
  bool? success;
  String? message;
  Data? data;

  AnnouncementsEntity({
    required this.success,
    required this.message,
    required this.data,
  });


  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Announcement>? announcements;

  Data({
    this.announcements,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    announcements: json["announcements"] == null ? [] : List<Announcement>.from(json["announcements"]!.map((x) => Announcement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "announcements": announcements == null ? [] : List<dynamic>.from(announcements!.map((x) => x.toJson())),
  };
}

class Announcement {
  int? id;
  String? name;
  String? announcementText;
  DateTime? createdAt;

  Announcement({
    this.id,
    this.name,
    this.announcementText,
    this.createdAt,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
    id: json["id"],
    name: json["name"],
    announcementText: json["announcement_text"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "announcement_text": announcementText,
    "created_at": createdAt?.toIso8601String(),
  };
}
