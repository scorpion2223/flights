import 'package:flightes/core/public/feature/cities/domain/entities/cities_entity.dart';

class CitiesModel extends CitiesEntity{
  CitiesModel({required super.cities});
  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    cities: json["cities"] == null ? [] : List<OneCity>.from(json["cities"]!.map((x) => OneCity.fromJson(x))),
  );
}