// To parse this JSON data, do
//
//     final countryCodesEntity = countryCodesEntityFromJson(jsonString);

import 'dart:convert';


String countryCodesEntityToJson(CountryCodesEntity data) => json.encode(data.toJson());

abstract class CountryCodesEntity {
  Data? data;

  CountryCodesEntity({
   required this.data,
  });



  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  List<Country>? countries;

  Data({
    this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: json["countries"] == null ? [] : List<Country>.from(json["countries"]!.map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": countries == null ? [] : List<dynamic>.from(countries!.map((x) => x.toJson())),
  };
}

class Country {
  String? countryName;
  String? code;

  Country({
    this.countryName,
    this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryName: json["country_name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "country_name": countryName,
    "code": code,
  };
}
