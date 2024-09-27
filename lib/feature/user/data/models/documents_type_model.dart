import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';

class DocumentsTypeModel extends DocumentsTypeEntity{
  DocumentsTypeModel({required super.documents});

  factory DocumentsTypeModel.fromJson(Map<String, dynamic> json) => DocumentsTypeModel(
    documents: json["documentTypes"] == null ? [] : List<OneDocument>.from(json["documentTypes"]!.map((x) => OneDocument.fromJson(x))),
  );

}