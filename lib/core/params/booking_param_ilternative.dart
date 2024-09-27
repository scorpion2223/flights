// To parse this JSON data, do
//
//     final bookingIlternativeParam = bookingIlternativeParamFromJson(jsonString);

import 'dart:convert';

BookingIlternativeParam bookingIlternativeParamFromJson(String str) => BookingIlternativeParam.fromJson(json.decode(str));

String bookingIlternativeParamToJson(BookingIlternativeParam data) => json.encode(data.toJson());

class BookingIlternativeParam {
  Data? data;

  BookingIlternativeParam({
    this.data,
  });

  BookingIlternativeParam copyWith({
    Data? data,
  }) =>
      BookingIlternativeParam(
        data: data ?? this.data,
      );

  factory BookingIlternativeParam.fromJson(Map<String, dynamic> json) => BookingIlternativeParam(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? type;
  List<dynamic>? flightOffers;
  List<Traveler>? travelers;
  Remarks? remarks;
  TicketingAgreement? ticketingAgreement;
  List<ContactElement>? contacts;

  Data({
    this.type,
    this.flightOffers,
    this.travelers,
    this.remarks,
    this.ticketingAgreement,
    this.contacts,
  });

  Data copyWith({
    String? type,
    List<dynamic>? flightOffers,
    List<Traveler>? travelers,
    Remarks? remarks,
    TicketingAgreement? ticketingAgreement,
    List<ContactElement>? contacts,
  }) =>
      Data(
        type: type ?? this.type,
        flightOffers: flightOffers ?? this.flightOffers,
        travelers: travelers ?? this.travelers,
        remarks: remarks ?? this.remarks,
        ticketingAgreement: ticketingAgreement ?? this.ticketingAgreement,
        contacts: contacts ?? this.contacts,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    flightOffers: json["flightOffers"] == null ? [] : List<dynamic>.from(json["flightOffers"]!.map((x) => x)),
    travelers: json["travelers"] == null ? [] : List<Traveler>.from(json["travelers"]!.map((x) => Traveler.fromJson(x))),
    remarks: json["remarks"] == null ? null : Remarks.fromJson(json["remarks"]),
    ticketingAgreement: json["ticketingAgreement"] == null ? null : TicketingAgreement.fromJson(json["ticketingAgreement"]),
    contacts: json["contacts"] == null ? [] : List<ContactElement>.from(json["contacts"]!.map((x) => ContactElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "flightOffers": flightOffers == null ? [] : List<dynamic>.from(flightOffers!.map((x) => x)),
    "travelers": travelers == null ? [] : List<dynamic>.from(travelers!.map((x) => x.toJson())),
    "remarks": remarks?.toJson(),
    "ticketingAgreement": ticketingAgreement?.toJson(),
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };
}

class ContactElement {
  Name? addresseeName;
  String? companyName;
  String? purpose;
  List<Phone>? phones;
  String? emailAddress;
  Address? address;

  ContactElement({
    this.addresseeName,
    this.companyName,
    this.purpose,
    this.phones,
    this.emailAddress,
    this.address,
  });

  ContactElement copyWith({
    Name? addresseeName,
    String? companyName,
    String? purpose,
    List<Phone>? phones,
    String? emailAddress,
    Address? address,
  }) =>
      ContactElement(
        addresseeName: addresseeName ?? this.addresseeName,
        companyName: companyName ?? this.companyName,
        purpose: purpose ?? this.purpose,
        phones: phones ?? this.phones,
        emailAddress: emailAddress ?? this.emailAddress,
        address: address ?? this.address,
      );

  factory ContactElement.fromJson(Map<String, dynamic> json) => ContactElement(
    addresseeName: json["addresseeName"] == null ? null : Name.fromJson(json["addresseeName"]),
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

class Remarks {
  List<General>? general;

  Remarks({
    this.general,
  });

  Remarks copyWith({
    List<General>? general,
  }) =>
      Remarks(
        general: general ?? this.general,
      );

  factory Remarks.fromJson(Map<String, dynamic> json) => Remarks(
    general: json["general"] == null ? [] : List<General>.from(json["general"]!.map((x) => General.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "general": general == null ? [] : List<dynamic>.from(general!.map((x) => x.toJson())),
  };
}

class General {
  String? subType;
  String? text;

  General({
    this.subType,
    this.text,
  });

  General copyWith({
    String? subType,
    String? text,
  }) =>
      General(
        subType: subType ?? this.subType,
        text: text ?? this.text,
      );

  factory General.fromJson(Map<String, dynamic> json) => General(
    subType: json["subType"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "subType": subType,
    "text": text,
  };
}

class TicketingAgreement {
  String? option;
  String? delay;

  TicketingAgreement({
    this.option,
    this.delay,
  });

  TicketingAgreement copyWith({
    String? option,
    String? delay,
  }) =>
      TicketingAgreement(
        option: option ?? this.option,
        delay: delay ?? this.delay,
      );

  factory TicketingAgreement.fromJson(Map<String, dynamic> json) => TicketingAgreement(
    option: json["option"],
    delay: json["delay"],
  );

  Map<String, dynamic> toJson() => {
    "option": option,
    "delay": delay,
  };
}

class Traveler {
  String? id;
  DateTime? dateOfBirth;
  Name? name;
  String? gender;
  TravelerContact? contact;
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
    TravelerContact? contact,
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
    contact: json["contact"] == null ? null : TravelerContact.fromJson(json["contact"]),
    documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "name": name?.toJson(),
    "gender": gender,
    "contact": contact?.toJson(),
    "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
  };
}

class TravelerContact {
  String? emailAddress;
  List<Phone>? phones;

  TravelerContact({
    this.emailAddress,
    this.phones,
  });

  TravelerContact copyWith({
    String? emailAddress,
    List<Phone>? phones,
  }) =>
      TravelerContact(
        emailAddress: emailAddress ?? this.emailAddress,
        phones: phones ?? this.phones,
      );

  factory TravelerContact.fromJson(Map<String, dynamic> json) => TravelerContact(
    emailAddress: json["emailAddress"],
    phones: json["phones"] == null ? [] : List<Phone>.from(json["phones"]!.map((x) => Phone.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
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
  bool? holder;

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
    bool? holder,
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
