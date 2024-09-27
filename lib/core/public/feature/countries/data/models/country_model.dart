import 'package:flightes/core/public/feature/countries/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity{
  CountryModel({required super.countries});

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    countries: json["countries"] == null ? [] : List<OneCountry>.from(json["countries"]!.map((x) => OneCountry.fromJson(x))),
  );
  
}