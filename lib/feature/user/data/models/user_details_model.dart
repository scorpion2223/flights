import 'package:flightes/feature/user/domain/entities/user_details_entity.dart';

class UserDetailsModel extends UserDetailsEntity{
  UserDetailsModel({required super.success, required super.message, required super.userDetails});



  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    success: json["success"],
    message: json["message"],
    userDetails: json["user details"] == null ? [] : List<UserDetail>.from(json["user details"]!.map((x) => UserDetail.fromJson(x))),
  );

}