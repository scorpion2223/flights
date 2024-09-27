// To parse this JSON data, do
//
//     final citiesEntity = citiesEntityFromJson(jsonString);

import 'dart:convert';



String citiesEntityToJson(CitiesEntity data) => json.encode(data.toJson());

abstract class CitiesEntity {
  List<OneCity>? cities;

  CitiesEntity({
  required  this.cities,
  });



  Map<String, dynamic> toJson() => {
    "": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
  };
}

class OneCity {
  int? id;
  String? name;
  int? countryId;

  OneCity({
    this.id,
    this.name,
    this.countryId,
  });

  factory OneCity.fromJson(Map<String, dynamic> json) => OneCity(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
  };
}
