// To parse this JSON data, do
//
//     final contactsEntity = contactsEntityFromJson(jsonString);

import 'dart:convert';


String contactsEntityToJson(ContactsEntity data) => json.encode(data.toJson());

abstract class ContactsEntity {
  List<Contact>? contacts;

  ContactsEntity({
    required this.contacts,
  });

  // ContactsEntity copyWith({
  //   List<Contact>? contacts,
  // }) =>
  //     ContactsEntity(
  //       contacts: contacts ?? this.contacts,
  //     );



  Map<String, dynamic> toJson() => {
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };

  Map<String,dynamic> toJsonConstants(){
    return {
      "contacts": [
        {
          "addresseeName": {
            "firstName": "PABLO",
            "lastName": "RODRIGUEZ"
          },
          "companyName": "INCREIBLE VIAJES",
          "purpose": "STANDARD",
          "phones": [
            {
              "deviceType": "LANDLINE",
              "countryCallingCode": "34",
              "number": "480080071"
            },
            {
              "deviceType": "MOBILE",
              "countryCallingCode": "33",
              "number": "480080072"
            }
          ],
          "emailAddress": "support@increibleviajes.es",
          "address": {
            "lines": [
              "Calle Prado, 16"
            ],
            "postalCode": "28014",
            "cityName": "Madrid",
            "countryCode": "ES"
          }
        }
      ]
    };

  }
}

class Contact {
  AddresseeName? addresseeName;
  String? companyName;
  String? purpose;
  List<Phone>? phones;
  String? emailAddress;
  Address? address;

  Contact({
    this.addresseeName,
    this.companyName,
    this.purpose,
    this.phones,
    this.emailAddress,
    this.address,
  });

  Contact copyWith({
    AddresseeName? addresseeName,
    String? companyName,
    String? purpose,
    List<Phone>? phones,
    String? emailAddress,
    Address? address,
  }) =>
      Contact(
        addresseeName: addresseeName ?? this.addresseeName,
        companyName: companyName ?? this.companyName,
        purpose: purpose ?? this.purpose,
        phones: phones ?? this.phones,
        emailAddress: emailAddress ?? this.emailAddress,
        address: address ?? this.address,
      );

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    addresseeName: json["addresseeName"] == null ? null : AddresseeName.fromJson(json["addresseeName"]),
    companyName: json["companyName"],
    purpose: json["purpose"],
    phones: json["phones"] == null ? [] : List<Phone>.from(json["phones"]!.map((x) => Phone.fromJson(x))),
    emailAddress: json["emailAddress"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "addresseeName": addresseeName?.toJson(),
    "companyName": companyName,
    "purpose": purpose,
    "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "emailAddress": emailAddress,
    "address": address?.toJson(),
  };
}

class Address {
  List<String>? lines;
  String? postalCode;
  String? cityName;
  String? countryCode;

  Address({
    this.lines,
    this.postalCode,
    this.cityName,
    this.countryCode,
  });

  Address copyWith({
    List<String>? lines,
    String? postalCode,
    String? cityName,
    String? countryCode,
  }) =>
      Address(
        lines: lines ?? this.lines,
        postalCode: postalCode ?? this.postalCode,
        cityName: cityName ?? this.cityName,
        countryCode: countryCode ?? this.countryCode,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    lines: json["lines"] == null ? [] : List<String>.from(json["lines"]!.map((x) => x)),
    postalCode: json["postalCode"],
    cityName: json["cityName"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "lines": lines == null ? [] : List<dynamic>.from(lines!.map((x) => x)),
    "postalCode": postalCode,
    "cityName": cityName,
    "countryCode": countryCode,
  };
}

class AddresseeName {
  String? firstName;
  String? lastName;

  AddresseeName({
    this.firstName,
    this.lastName,
  });

  AddresseeName copyWith({
    String? firstName,
    String? lastName,
  }) =>
      AddresseeName(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory AddresseeName.fromJson(Map<String, dynamic> json) => AddresseeName(
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };
}

class Phone {
  String? deviceType;
  String? countryCallingCode;
  String? number;

  Phone({
    this.deviceType,
    this.countryCallingCode,
    this.number,
  });

  Phone copyWith({
    String? deviceType,
    String? countryCallingCode,
    String? number,
  }) =>
      Phone(
        deviceType: deviceType ?? this.deviceType,
        countryCallingCode: countryCallingCode ?? this.countryCallingCode,
        number: number ?? this.number,
      );

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    deviceType: json["deviceType"],
    countryCallingCode: json["countryCallingCode"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "deviceType": deviceType,
    "countryCallingCode": countryCallingCode,
    "number": number,
  };
}
