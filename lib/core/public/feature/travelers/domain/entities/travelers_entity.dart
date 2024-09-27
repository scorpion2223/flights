// To parse this JSON data, do
//
//     final travelersEntity = travelersEntityFromJson(jsonString);

import 'dart:convert';


// String travelersEntityToJson(TravelersEntity data) => json.encode(data.toJson());

abstract class TravelersEntity {
  Traveler? travelers;

  TravelersEntity({
  required  this.travelers,
  });

  // TravelersEntity copyWith({
  //   List<Traveler>? travelers,
  // }) =>
  //     TravelersEntity(
  //       travelers: travelers ?? this.travelers,
  //     );



  Map<String, dynamic> toJson() => {
    "travelers": travelers == null ?null : [travelers?.toJson()],
  };


  Map<String,dynamic> toJsonConstants(){
    return {
      "travelers": [
        {
          "id": "1",
          "dateOfBirth": "1982-01-16",
          "name": {
            "firstName": "JORGE",
            "lastName": "GONZALES"
          },
          "gender": "MALE",
          "contact": {
            "emailAddress": "jorge.gonzales833@telefonica.es",
            "phones": [
              {
                "deviceType": "MOBILE",
                "countryCallingCode": "34",
                "number": "480080076"
              }
            ]
          },
          "documents": [
            {
              "documentType": "PASSPORT",
              "birthPlace": "Madrid",
              "issuanceLocation": "Madrid",
              "issuanceDate": "2015-04-14",
              "number": "00000000",
              "expiryDate": "2025-04-14",
              "issuanceCountry": "ES",
              "validityCountry": "ES",
              "nationality": "ES",
              "holder": true
            }
          ]
        },
        {
          "id": "2",
          "dateOfBirth": "2012-10-11",
          "gender": "FEMALE",
          "contact": {
            "emailAddress": "jorge.gonzales833@telefonica.es",
            "phones": [
              {
                "deviceType": "MOBILE",
                "countryCallingCode": "34",
                "number": "480080076"
              }
            ]
          },
          "name": {
            "firstName": "ADRIANA",
            "lastName": "GONZALES"
          }
        }
      ],
    };
  }

}


class Traveler {
  String? id;
  DateTime? dateOfBirth;
  Name? name;
  String? gender;
  Contacts? contact;
  List<Document>? documents;

  Traveler({
    this.id,
    this.dateOfBirth,
    this.name,
    this.gender,
    this.contact,
    this.documents,
  });

  Traveler copyWith({
    String? id,
    DateTime? dateOfBirth,
    Name? name,
    String? gender,
    Contacts? contact,
    List<Document>? documents,
  }) =>
      Traveler(
        id: id ?? this.id,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        contact: contact ?? this.contact,
        documents: documents ?? this.documents,
      );

  factory Traveler.fromJson(Map<String, dynamic> json) => Traveler(
    id: json["id"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    gender: json["gender"],
    contact: json["contact"] == null ? null : Contacts.fromJson(json["contact"]),
    documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dateOfBirth": dateOfBirth == null?null:"${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "name": name?.toJson(),
    "gender": gender,
    "contact": contact?.toJson(),
    "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
  };
}
class Contacts {
  String? emailAddress;
  List<Phone>? phones;

  Contacts({
    this.emailAddress,
    this.phones,
  });

  Contacts copyWith({
    String? emailAddress,
    List<Phone>? phones,
  }) =>
      Contacts(
        emailAddress: emailAddress ?? this.emailAddress,
        phones: phones ?? this.phones,
      );

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
    emailAddress: json["emailAddress"],
    phones: json["phones"] == null ? [] : List<Phone>.from(json["phones"]!.map((x) => Phone.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
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

class Document {
  String? documentType;
  String? birthPlace;
  String? issuanceLocation;
  DateTime? issuanceDate;
  String? number;
  DateTime? expiryDate;
  String? issuanceCountry;
  String? validityCountry;
  String? nationality;
  int? holder;

  Document({
    this.documentType,
    this.birthPlace,
    this.issuanceLocation,
    this.issuanceDate,
    this.number,
    this.expiryDate,
    this.issuanceCountry,
    this.validityCountry,
    this.nationality,
    this.holder,
  });

  Document copyWith({
    String? documentType,
    String? birthPlace,
    String? issuanceLocation,
    DateTime? issuanceDate,
    String? number,
    DateTime? expiryDate,
    String? issuanceCountry,
    String? validityCountry,
    String? nationality,
    int? holder,
  }) =>
      Document(
        documentType: documentType ?? this.documentType,
        birthPlace: birthPlace ?? this.birthPlace,
        issuanceLocation: issuanceLocation ?? this.issuanceLocation,
        issuanceDate: issuanceDate ?? this.issuanceDate,
        number: number ?? this.number,
        expiryDate: expiryDate ?? this.expiryDate,
        issuanceCountry: issuanceCountry ?? this.issuanceCountry,
        validityCountry: validityCountry ?? this.validityCountry,
        nationality: nationality ?? this.nationality,
        holder: holder ?? this.holder,
      );

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentType: json["documentType"],
    birthPlace: json["birthPlace"],
    issuanceLocation: json["issuanceLocation"],
    issuanceDate: json["issuanceDate"] == null ? null : DateTime.parse(json["issuanceDate"]),
    number: json["number"],
    expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
    issuanceCountry: json["issuanceCountry"],
    validityCountry: json["validityCountry"],
    nationality: json["nationality"],
    holder: json["holder"],
  );

  Map<String, dynamic> toJson() => {
    "documentType": documentType,
    "birthPlace": birthPlace,
    "issuanceLocation": issuanceLocation,
    "issuanceDate": "${issuanceDate!.year.toString().padLeft(4, '0')}-${issuanceDate!.month.toString().padLeft(2, '0')}-${issuanceDate!.day.toString().padLeft(2, '0')}",
    "number": number,
    "expiryDate": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "issuanceCountry": issuanceCountry,
    "validityCountry": validityCountry,
    "nationality": nationality,
    "holder": holder,
  };
}

class Name {
  String? firstName;
  String? lastName;

  Name({
    this.firstName,
    this.lastName,
  });

  Name copyWith({
    String? firstName,
    String? lastName,
  }) =>
      Name(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };
}
