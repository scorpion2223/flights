// To parse this JSON data, do
//
//     final airPortsEntity = airPortsEntityFromJson(jsonString);

import 'dart:convert';


String airPortsEntityToJson(AirPortsEntity data) => json.encode(data.toJson());

abstract class AirPortsEntity {
  Headers? headers;
  Original? original;
  dynamic exception;

  AirPortsEntity({
   required this.headers,
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
  Meta? meta;
  List<Datum>? data;
  List<dynamic> ? errors;

  Original({
    this.meta,
    this.data,
    this.errors
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? type;
  String? subType;
  String? name;
  String? detailedName;
  String? id;
  Self? self;
  String? timeZoneOffset;
  String? iataCode;
  GeoCode? geoCode;
  Address? address;
  Analytics? analytics;

  Datum({
    this.type,
    this.subType,
    this.name,
    this.detailedName,
    this.id,
    this.self,
    this.timeZoneOffset,
    this.iataCode,
    this.geoCode,
    this.address,
    this.analytics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    subType: json["subType"],
    name: json["name"],
    detailedName: json["detailedName"],
    id: json["id"],
    self: json["self"] == null ? null : Self.fromJson(json["self"]),
    timeZoneOffset: json["timeZoneOffset"],
    iataCode: json["iataCode"],
    geoCode: json["geoCode"] == null ? null : GeoCode.fromJson(json["geoCode"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    analytics: json["analytics"] == null ? null : Analytics.fromJson(json["analytics"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "subType": subType,
    "name": name,
    "detailedName": detailedName,
    "id": id,
    "self": self?.toJson(),
    "timeZoneOffset": timeZoneOffset,
    "iataCode": iataCode,
    "geoCode": geoCode?.toJson(),
    "address": address?.toJson(),
    "analytics": analytics?.toJson(),
  };
}

class Address {
  String? cityName;
  String? cityCode;
  String? countryName;
  String? countryCode;
  String? regionCode;

  Address({
    this.cityName,
    this.cityCode,
    this.countryName,
    this.countryCode,
    this.regionCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    cityName: json["cityName"],
    cityCode: json["cityCode"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
    regionCode: json["regionCode"],
  );

  Map<String, dynamic> toJson() => {
    "cityName": cityName,
    "cityCode": cityCode,
    "countryName": countryName,
    "countryCode": countryCode,
    "regionCode": regionCode,
  };
}

class Analytics {
  Travelers? travelers;

  Analytics({
    this.travelers,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
    travelers: json["travelers"] == null ? null : Travelers.fromJson(json["travelers"]),
  );

  Map<String, dynamic> toJson() => {
    "travelers": travelers?.toJson(),
  };
}

class Travelers {
  int? score;

  Travelers({
    this.score,
  });

  factory Travelers.fromJson(Map<String, dynamic> json) => Travelers(
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "score": score,
  };
}

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

class Self {
  String? href;
  List<String>? methods;

  Self({
    this.href,
    this.methods,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
    methods: json["methods"] == null ? [] : List<String>.from(json["methods"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "methods": methods == null ? [] : List<dynamic>.from(methods!.map((x) => x)),
  };
}

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
