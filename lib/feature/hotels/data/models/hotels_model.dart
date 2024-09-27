import 'package:flightes/feature/hotels/domain/entities/hotels_entity.dart';

class HotelsModel extends HotelsEntity{
  HotelsModel({required super.headers, required super.original, required super.exception});
  factory HotelsModel.fromJson(Map<String, dynamic> json) => HotelsModel(
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    original: json["original"] == null ? null : Original.fromJson(json["original"]),
    exception: json["exception"],
  );





}