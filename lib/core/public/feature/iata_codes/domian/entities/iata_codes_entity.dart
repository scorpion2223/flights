// To parse this JSON data, do
//
//     final iataCodes = iataCodesFromJson(jsonString);

import 'dart:convert';


String iataCodesToJson(IataCodes data) => json.encode(data.toJson());

abstract class IataCodes {
  String? message;
  List<Datum>? data;

  IataCodes({
   required this.message,
   required this.data,
  });



  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? code;
  String? name;

  Datum({
    this.code,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
