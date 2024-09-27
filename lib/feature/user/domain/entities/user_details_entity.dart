// To parse this JSON data, do
//
//     final userDetailsEntity = userDetailsEntityFromJson(jsonString);

import 'dart:convert';



String userDetailsEntityToJson(UserDetailsEntity data) => json.encode(data.toJson());

abstract class UserDetailsEntity {
  bool? success;
  String? message;
  List<UserDetail>? userDetails;

  UserDetailsEntity({
   required this.success,
    required   this.message,
    required this.userDetails,
  });


  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user details": userDetails == null ? [] : List<dynamic>.from(userDetails!.map((x) => x.toJson())),
  };
}

class UserDetail {
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
  List<dynamic>? addresses;

  UserDetail({
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
    this.addresses,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
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
    addresses: json["addresses"] == null ? [] : List<dynamic>.from(json["addresses"]!.map((x) => x)),
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
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x)),
  };
}
