import 'package:flightes/core/public/feature/iata_codes/domian/entities/iata_codes_entity.dart';

class IataCodesModel extends IataCodes{
  IataCodesModel({required super.message, required super.data});
  factory IataCodesModel.fromJson(Map<String, dynamic> json) => IataCodesModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

}