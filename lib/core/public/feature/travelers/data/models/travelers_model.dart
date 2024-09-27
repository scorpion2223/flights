import 'package:flightes/core/public/feature/travelers/domain/entities/travelers_entity.dart';

class TravelersModel extends TravelersEntity{
  TravelersModel({required super.travelers});
  factory TravelersModel.fromJson(Map<String, dynamic> json) => TravelersModel(
    travelers: json["traveler"] == null ? null : Traveler.fromJson(json["traveler"]!),
  );

}