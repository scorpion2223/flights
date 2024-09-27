import 'package:flightes/feature/announcements/domain/entities/announcements_entity.dart';

class AnnouncementsModel extends AnnouncementsEntity{
  AnnouncementsModel({required super.success, required super.message, required super.data});
  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) => AnnouncementsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}