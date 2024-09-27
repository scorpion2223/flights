// To parse this JSON data, do
//
//     final authInformationEntity = authInformationEntityFromJson(jsonString);

import 'dart:convert';


String authInformationEntityToJson(AuthInformationEntity data) => json.encode(data.toJson());

abstract class AuthInformationEntity {
  String? token;
  User? user;

  AuthInformationEntity({
     required this.token,
 required   this.user,
  });



  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  dynamic fcmToken;
  String? email;
  dynamic emailVerifiedAt;
  dynamic passportExpirationDate;
  dynamic passportNumber;
  dynamic alternativePhoneNumber;
  dynamic nationalIdNumber;
  dynamic personalPhoto;
  bool? isActive;
  int? points;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.fcmToken,
    this.email,
    this.emailVerifiedAt,
    this.passportExpirationDate,
    this.passportNumber,
    this.alternativePhoneNumber,
    this.nationalIdNumber,
    this.personalPhoto,
    this.isActive,
    this.points,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    fcmToken: json["fcm_token"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    passportExpirationDate: json["passport_expiration_date"],
    passportNumber: json["passport_number"],
    alternativePhoneNumber: json["alternative_phone_number"],
    nationalIdNumber: json["national_id_number"],
    personalPhoto: json["personal_photo"],
    isActive: json["is_active"],
    points: json["points"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "fcm_token": fcmToken,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "passport_expiration_date": passportExpirationDate,
    "passport_number": passportNumber,
    "alternative_phone_number": alternativePhoneNumber,
    "national_id_number": nationalIdNumber,
    "personal_photo": personalPhoto,
    "is_active": isActive,
    "points": points,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
