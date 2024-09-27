// To parse this JSON data, do
//
//     final userDocumentsEntity = userDocumentsEntityFromJson(jsonString);

import 'dart:convert';


String userDocumentsEntityToJson(UserDocumentsEntity data) => json.encode(data.toJson());

abstract class UserDocumentsEntity {
  List<OneUserDocument>? documents;

  UserDocumentsEntity({
    required this.documents,
  });




  Map<String, dynamic> toJson() => {
    "One User Document": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
  };
}

class OneUserDocument {
  int? id;
  dynamic documentTypeId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? documentNumber;
  dynamic birthPlace;
  String? issuanceLocation;
  DateTime? issuanceDate;
  DateTime? expiryDate;
  dynamic issuanceCountry;
  dynamic validityCountry;
  dynamic nationality;
  int? holder;
  User? user;

  OneUserDocument({
    this.id,
    this.documentTypeId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.documentNumber,
    this.birthPlace,
    this.issuanceLocation,
    this.issuanceDate,
    this.expiryDate,
    this.issuanceCountry,
    this.validityCountry,
    this.nationality,
    this.holder,
    this.user,
  });

  OneUserDocument copyWith({
    int? id,
    dynamic documentTypeId,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentNumber,
    dynamic birthPlace,
    String? issuanceLocation,
    DateTime? issuanceDate,
    DateTime? expiryDate,
    dynamic issuanceCountry,
    dynamic validityCountry,
    dynamic nationality,
    int? holder,
    User? user,
  }) =>
      OneUserDocument(
        id: id ?? this.id,
        documentTypeId: documentTypeId ?? this.documentTypeId,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        documentNumber: documentNumber ?? this.documentNumber,
        birthPlace: birthPlace ?? this.birthPlace,
        issuanceLocation: issuanceLocation ?? this.issuanceLocation,
        issuanceDate: issuanceDate ?? this.issuanceDate,
        expiryDate: expiryDate ?? this.expiryDate,
        issuanceCountry: issuanceCountry ?? this.issuanceCountry,
        validityCountry: validityCountry ?? this.validityCountry,
        nationality: nationality ?? this.nationality,
        holder: holder ?? this.holder,
        user: user ?? this.user,
      );

  factory OneUserDocument.fromJson(Map<String, dynamic> json) => OneUserDocument(
    id: json["id"],
    documentTypeId: json["document_type_id"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    documentNumber: json["document_number"],
    birthPlace: json["birth_place"],
    issuanceLocation: json["issuance_location"],
    issuanceDate: json["issuance_date"] == null ? null : DateTime.parse(json["issuance_date"]),
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    issuanceCountry: json["issuance_country"],
    validityCountry: json["validity_country"],
    nationality: json["nationality"],
    holder: json["holder"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "document_type_id": documentTypeId,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "document_number": documentNumber,
    "birth_place": birthPlace,
    "issuance_location": issuanceLocation,
    "issuance_date": "${issuanceDate!.year.toString().padLeft(4, '0')}-${issuanceDate!.month.toString().padLeft(2, '0')}-${issuanceDate!.day.toString().padLeft(2, '0')}",
    "expiry_date": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "issuance_country": issuanceCountry,
    "validity_country": validityCountry,
    "nationality": nationality,
    "holder": holder,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  dynamic firstName;
  dynamic lastName;
  String? phoneNumber;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phoneCountryCode;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic passportExpirationDate;
  dynamic passportNumber;
  dynamic alternativePhoneNumber;
  dynamic nationalIdNumber;
  dynamic personalPhoto;
  bool? isActive;
  int? points;
  String? fcmToken;

  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.phoneCountryCode,
    this.gender,
    this.dateOfBirth,
    this.passportExpirationDate,
    this.passportNumber,
    this.alternativePhoneNumber,
    this.nationalIdNumber,
    this.personalPhoto,
    this.isActive,
    this.points,
    this.fcmToken,
  });

  User copyWith({
    int? id,
    String? name,
    dynamic firstName,
    dynamic lastName,
    String? phoneNumber,
    String? email,
    dynamic emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic phoneCountryCode,
    dynamic gender,
    dynamic dateOfBirth,
    dynamic passportExpirationDate,
    dynamic passportNumber,
    dynamic alternativePhoneNumber,
    dynamic nationalIdNumber,
    dynamic personalPhoto,
    bool? isActive,
    int? points,
    String? fcmToken,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        passportExpirationDate: passportExpirationDate ?? this.passportExpirationDate,
        passportNumber: passportNumber ?? this.passportNumber,
        alternativePhoneNumber: alternativePhoneNumber ?? this.alternativePhoneNumber,
        nationalIdNumber: nationalIdNumber ?? this.nationalIdNumber,
        personalPhoto: personalPhoto ?? this.personalPhoto,
        isActive: isActive ?? this.isActive,
        points: points ?? this.points,
        fcmToken: fcmToken ?? this.fcmToken,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    phoneCountryCode: json["phone_country_code"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    passportExpirationDate: json["passport_expiration_date"],
    passportNumber: json["passport_number"],
    alternativePhoneNumber: json["alternative_phone_number"],
    nationalIdNumber: json["national_id_number"],
    personalPhoto: json["personal_photo"],
    isActive: json["is_active"],
    points: json["points"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "phone_country_code": phoneCountryCode,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "passport_expiration_date": passportExpirationDate,
    "passport_number": passportNumber,
    "alternative_phone_number": alternativePhoneNumber,
    "national_id_number": nationalIdNumber,
    "personal_photo": personalPhoto,
    "is_active": isActive,
    "points": points,
    "fcm_token": fcmToken,
  };
}
