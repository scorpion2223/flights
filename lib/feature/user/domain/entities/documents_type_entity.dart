// To parse this JSON data, do
//
//     final documentsTypeEntity = documentsTypeEntityFromJson(jsonString);

import 'dart:convert';


String documentsTypeEntityToJson(DocumentsTypeEntity data) => json.encode(data.toJson());

abstract class DocumentsTypeEntity {
  List<OneDocument>? documents;

  DocumentsTypeEntity({
 required   this.documents,
  });



  Map<String, dynamic> toJson() => {
    "": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
  };
}

class OneDocument {
  int? id;
  String? name;
  String? description;

  OneDocument({
    this.id,
    this.name,
    this.description,
  });

  factory OneDocument.fromJson(Map<String, dynamic> json) => OneDocument(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
