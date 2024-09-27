import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';

class ContactsModel extends ContactsEntity{
  ContactsModel({required super.contacts});
  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
    contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
  );
}