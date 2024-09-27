import 'package:flightes/feature/air_porst/domain/entities/air_ports_entity.dart';

class AirPortsModel extends AirPortsEntity{
  AirPortsModel({required super.headers, required super.original, required super.exception});


  factory AirPortsModel.fromJson(Map<String, dynamic> json) => AirPortsModel(
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    original: json["original"] == null ? null : Original.fromJson(json["original"]),
    exception: json["exception"],
  );

}