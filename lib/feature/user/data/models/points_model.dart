import 'package:flightes/feature/user/domain/entities/points_entity.dart';

class PointsModel extends PointsEntity{
  PointsModel({required super.success, required super.message, required super.points});
  factory PointsModel.fromJson(Map<String, dynamic> json) => PointsModel(
    success: json["success"],
    message: json["message"],
    points: json["points"],
  );

}