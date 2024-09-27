// To parse this JSON data, do
//
//     final pointsEntity = pointsEntityFromJson(jsonString);

import 'dart:convert';




abstract class PointsEntity {
  bool? success;
  String? message;
  int? points;

  PointsEntity({
   required this.success,
    required this.message,
    required this.points,
  });




}
