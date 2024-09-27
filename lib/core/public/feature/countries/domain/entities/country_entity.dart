// To parse this JSON data, do
//
//     final countryEntity = countryEntityFromJson(jsonString);

import 'dart:convert';
abstract class CountryEntity{
  List<OneCountry>? countries;

  CountryEntity({
    required this.countries
});
}


class OneCountry {
  int? id;
  String? name;

  OneCountry({
    this.id,
    this.name,
  });

  factory OneCountry.fromJson(Map<String, dynamic> json) => OneCountry(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
