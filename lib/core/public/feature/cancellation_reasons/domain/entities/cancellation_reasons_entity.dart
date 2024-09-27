// To parse this JSON data, do
//
//     final cancellationReasonsEntity = cancellationReasonsEntityFromJson(jsonString);

import 'dart:convert';


String cancellationReasonsEntityToJson(CancellationReasonsEntity data) => json.encode(data.toJson());

abstract class CancellationReasonsEntity {
  List<Datum>? data;

  CancellationReasonsEntity({
    required this.data,
  });



  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? reason;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    reason: json["reason"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
