import 'package:flightes/feature/flights/domain/entities/flights.dart';

class FlightsModel extends Flights{
  FlightsModel({required super.data});
  factory FlightsModel.fromJson(Map<String, dynamic> json) => FlightsModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}