import 'package:flightes/core/public/feature/country_codes/domain/entities/country_code_entity.dart';

class CountryCodeModel extends CountryCodesEntity{
  CountryCodeModel({required super.data});

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => CountryCodeModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}