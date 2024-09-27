import 'package:flightes/feature/user/domain/entities/user_documents_entity.dart';

class UserDocumentsModel extends UserDocumentsEntity{
  UserDocumentsModel({required super.documents});
  factory UserDocumentsModel.fromJson(List<dynamic> json) => UserDocumentsModel(
    documents: json.isEmpty ? [] : List<OneUserDocument>.from(json.map((x) => OneUserDocument.fromJson(x))),
  );



}