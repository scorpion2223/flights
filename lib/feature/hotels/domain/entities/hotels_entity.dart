// To parse this JSON data, do
//
//     final hotelsEntity = hotelsEntityFromJson(jsonString);

import 'dart:convert';


String hotelsEntityToJson(HotelsEntity data) => json.encode(data.toJson());

abstract class HotelsEntity {
  Headers? headers;
  Original? original;
  dynamic exception;

  HotelsEntity({
 required   this.headers,
    required this.original,
    required this.exception,
  });


  Map<String, dynamic> toJson() => {
    "headers": headers?.toJson(),
    "original": original?.toJson(),
    "exception": exception,
  };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Original {
  List<Datum>? data;
  Meta? meta;
  List<dynamic> ? errors;

  Original({
    this.data,
    this.meta,
    this.errors
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datum {
  String? chainCode;
  IataCode? iataCode;
  int? dupeId;
  String? name;
  String? hotelId;
  GeoCode? geoCode;
  Address? address;
  DateTime? lastUpdate;

  Datum({
    this.chainCode,
    this.iataCode,
    this.dupeId,
    this.name,
    this.hotelId,
    this.geoCode,
    this.address,
    this.lastUpdate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    chainCode: json["chainCode"],
    iataCode: iataCodeValues.map[json["iataCode"]],
    dupeId: json["dupeId"],
    name: json["name"],
    hotelId: json["hotelId"],
    geoCode: json["geoCode"] == null ? null : GeoCode.fromJson(json["geoCode"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "chainCode": chainCode,
    "iataCode": iataCodeValues.reverse[iataCode],
    "dupeId": dupeId,
    "name": name,
    "hotelId": hotelId,
    "geoCode": geoCode?.toJson(),
    "address": address?.toJson(),
    "lastUpdate": lastUpdate?.toIso8601String(),
  };
}

class Address {
  CountryCode? countryCode;

  Address({
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    countryCode: countryCodeValues.map[json["countryCode"]],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCodeValues.reverse[countryCode],
  };
}

enum CountryCode {
  ES,
  FI,
  FR,
  ID,
  IN,
  MX,
  US
}

final countryCodeValues = EnumValues({
  "ES": CountryCode.ES,
  "FI": CountryCode.FI,
  "FR": CountryCode.FR,
  "ID": CountryCode.ID,
  "IN": CountryCode.IN,
  "MX": CountryCode.MX,
  "US": CountryCode.US
});

class GeoCode {
  double? latitude;
  double? longitude;

  GeoCode({
    this.latitude,
    this.longitude,
  });

  factory GeoCode.fromJson(Map<String, dynamic> json) => GeoCode(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

enum IataCode {
  PAR
}

final iataCodeValues = EnumValues({
  "PAR": IataCode.PAR
});

class Meta {
  int? count;
  Links? links;

  Meta({
    this.count,
    this.links,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    count: json["count"],
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "links": links?.toJson(),
  };
}

class Links {
  String? self;

  Links({
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
