import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flightes/core/params/validators_param.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../utils/constatnts/country_name.dart';

class DocumentParam extends ValidatorsParam{
  String?documentName;
  int ?userId;
  File?file;
  DateTime?storageDate;
  DateTime?expireDate;
  int?documentTypeId;
  String?documentNumber;
  String?birthPlace;//country name
  /////////////////////////////
  String?issuanceLocation;
  DateTime?issuanceDate;
  DateTime?expiryDate;
  String?issuanceCountry;//country name
  ///////////////////////
  String?validityCountry;// country name
  String?nationality;//country name
  int?holder;






  DocumentParam(
      this.documentName,
      this.userId,
      this.file,
      this.storageDate,
      this.expireDate,
      this.documentTypeId,
      this.documentNumber,
      this.birthPlace,
      this.issuanceLocation,
      this.issuanceDate,
      this.issuanceCountry,
      this.expiryDate,
      this.validityCountry,
      this.nationality,
      this.holder
      );
  
  factory DocumentParam.newParam(){
    return DocumentParam(null, userID, null, DateTime.now(), DateTime.now(),null,null,countryNames.first,null,DateTime.now(),countryNames.first,DateTime.now(),countryNames.first,countryNames.first,1);

  }

 Future <FormData> toJson()async{

    final myFile = await MultipartFile.fromFile(file!.path);
    log("my file : $myFile");

    return FormData.fromMap( {
      "file" :myFile,
      'document_name': documentName,
      'user_id': userId,
      'storage_date': DateFormat('yyyy-MM-dd').format(storageDate!).toString(),
      'expire_date': DateFormat('yyyy-MM-dd').format(expireDate!).toString(),
      'document_type_id': documentTypeId,
      'document_number' : documentNumber,
    'birth_place' :birthPlace,
    'issuance_location' : issuanceLocation,
    'issuance_date' : DateFormat('yyyy-MM-dd').format(issuanceDate!).toString(),
    'expiry_date' : DateFormat('yyyy-MM-dd').format(expiryDate!).toString(),
    'issuance_country' : issuanceCountry,
    'validity_country' : validityCountry,
    'nationality' : nationality,
    'holder' : holder,

    });
  }
  Future <Map<String , dynamic>> toJsonModify(int id)async{
    final myFile = await MultipartFile.fromFile(file!.path);

    return {
      "file" :myFile,
      'document_name': documentName,
      'user_id': userId,
      'storage_date': DateFormat('yyyy-MM-dd').format(storageDate!).toString(),
      'expire_date':  DateFormat('yyyy-MM-dd').format(expireDate!).toString(),
      'document_type_id': documentTypeId,
      "document_id":id,

    };
  }

  DocumentParam copyWith({
    String?documentName,
    int ?userId,
    File?file,
    DateTime?storageDate,
    DateTime?expireDate,
    int?documentTypeId,
    String?documentNumber,
    String?birthPlace,
    String?issuanceLocation,
    DateTime?issuanceDate,
    String?issuanceCountry,
    DateTime?expiryDate,
    String?validityCountry,
    String?nationality,
    int?holder,
}){
    return DocumentParam(documentName??this.documentName, userId??this.userId, file??this.file,
        storageDate??this.storageDate, expireDate??this.expireDate, documentTypeId??this.documentTypeId,
    documentNumber??this.documentNumber,birthPlace??this.birthPlace,issuanceLocation??this.issuanceLocation,
        issuanceDate??this.issuanceDate,issuanceCountry??this.issuanceCountry,expiryDate??this.expiryDate,
        validityCountry??this.validityCountry,nationality??this.nationality,holder??this.holder
    );
}

}