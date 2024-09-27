import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/utils/extensions/string_extension.dart';

import 'package:intl/intl.dart';

import '../../main.dart';
import '../utils/constatnts/validation_message.dart';

class UserParam {
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;
  final String? confirmPassword;


/////constructor/////////////
  UserParam(
      this.userName,
      this.firstName,
      this.lastName,

      this.phone,

      this.email,
      this.password,
      this.confirmPassword,
     );

  static const _18_Years = Duration(days: 18 * 365);

  ////////////factory/////////////////////////////
  factory UserParam.newUser() {
    return UserParam(null, null, null, null,
        null, null, null,);
  }







  //////to json ////////////////////////////////


  Map<String,dynamic> toJsonRegister( )  {

    return {
      'first_name': firstName,
      'name': userName,
      'last_name': lastName,
      'phone_number': phone,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword
    };
  }

  Map<String, dynamic> toJsonLogin() {
    log("$email\n"
        "$password");
    return {
      'email': email,
      'password': password,
      'fcm_token': "${fcMToken}"
    };
  }



  /////validators//////////////////////
  String? emailValidator(String? email) {
    ////  عودة من أجل ==null
    if (email == null || email.isWhiteSpace()) {
      return ValidationMessage.emptyField;
    }
    if (!email.isValidEmail()) {
      return "";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isWhiteSpace()) {
      return ValidationMessage.emptyField;
    }
    if (password.isValidPassword()) {
      return "ValidationMessages.passwordLength";
    }
    return null;
  }

  String? confirmPasswordValidator(String? password) {
    if (password == null || password.isWhiteSpace()) {
      return ValidationMessage.emptyField;
    }

    if (password != this.password) {
      return ValidationMessage.notSamePassword;
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone!.isEmpty) {
      return "يجب ملئ الحقل";
    }

    if (!(phone.startsWith('093') ||
        phone.startsWith('094') ||
        phone.startsWith('095') ||
        phone.startsWith('096') ||
        phone.startsWith('098') ||
        phone.startsWith('099'))) {
      return "رقم غير صالح";
    }

    if (phone.isValidPhoneLingth()) {
      return "رقم غير صالح";
    }

    return null;
  }

  String? birthDateValidator(DateTime? birthDate) {
    final now = DateTime.now();
    if (birthDate == null) {
      return "أدخل تاريخ الميلاد";
    }
    if (!birthDate.isBefore(DateTime(now.year, now.month, now.day))) {
      return "لا يمكن أن يكون تاريخ الميلاد من المستقبل !";
    }

    return null;
  }

  String? nameValidator(String? name) {
    if (name!.isEmpty || name.isWhiteSpace()) {
      return ValidationMessage.emptyField;
    }
    // if (name.isValidNameString()) {
    //   return ValidationMessages.inValidNAme;
    // }
    // if (name.isValidNameMaxLenght()) {
    //   return ValidationMessages.longName;
    // }
    //
    // if (name.isValidNameMinLenght()) {
    //   return ValidationMessages.shortName;
    // }

    return null;
  }



  String? codeValidator(String? code) {
    if (code!.isEmpty) {
      return "";
    }
    return null;
  }

  ////copy with//////////////////////////////////

  UserParam copyWith({
    String? userName,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return UserParam(
        userName ?? this.userName,
        firstName ?? this.firstName,
        lastName ?? this.lastName,
        phone ?? this.phone,

        email ?? this.email,
        password ?? this.password,
        confirmPassword ?? this.confirmPassword,
       );
  }
}
