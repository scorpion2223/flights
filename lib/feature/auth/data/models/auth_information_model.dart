import 'package:flightes/feature/auth/domain/entities/auth_information_entity.dart';

class AuthInformationModel extends AuthInformationEntity{
  AuthInformationModel({required super.token, required super.user});

  factory AuthInformationModel.fromJson(Map<String, dynamic> json) => AuthInformationModel(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

}