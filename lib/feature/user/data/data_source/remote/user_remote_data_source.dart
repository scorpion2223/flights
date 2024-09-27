import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/params/address_param.dart';
import 'package:flightes/core/params/contact_param.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:intl/intl.dart';

import '../../models/documents_type_model.dart';
import '../../models/points_model.dart';
import '../../models/user_details_model.dart';
import '../../models/user_documents_model.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;

const String STORE_DOCUMENTS_ = NetworkUrl.userStoreDocuments;

const String GET_ALL_DOCUMENTS_ = NetworkUrl.userGetAllDocuments;

const String GET_DOCUMENTS_ = NetworkUrl.userGetDocuments;

const String ADD_ADDRESS = NetworkUrl.userAddAddress;

const String MODIFY_DOCUMENT_ = NetworkUrl.userModifyDocument;

const String DELETE_DOCUMENT_ = NetworkUrl.userDeleteDocument;

const String UPDATE_DETAILS_ = NetworkUrl.userUpdateDetails;

const String GET_DETAILS_ = NetworkUrl.userGetDetails;

const String GET_POINTS_ = NetworkUrl.userGetPoints;

const String GET_DOCUMENTS_TYPE_ = NetworkUrl.userGetDocumentsType;


abstract class UserRemoteDataSource{
Future<PointsModel> getPoints(int id);
Future<Unit> addAddress(ContactParam param);
Future<DocumentsTypeModel> getDocumentsType();
Future<UserDetailsModel> getUserDetails(int userId);
Future<UserDocumentsModel> getUserDocuments(int userId);
Future<Unit> deleteDocument(int documentId);
Future<Unit> addDocument(DocumentParam param);
Future<Unit> modifyDocument(DocumentParam param,int documentId);






}

class UserRemoteDataSourceWithDio implements UserRemoteDataSource{
  final Dio dio;

  UserRemoteDataSourceWithDio({required this.dio});

  @override
  Future<PointsModel> getPoints(int id) async{
    final data = {
      "user_id" :id
    };
    final response = await dio.post("$BASE_URL_$GET_POINTS_",data: data,options: DioOptionUtils().options);
    if(response .  statusCode == 200){
      return PointsModel.fromJson(response.data);

    }else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addAddress(ContactParam param)async {
    final data = param.toJson(null);
    final response = await dio.post("${BASE_URL_}contacts",data: data,options: DioOptionUtils().options);
    log(response.toString());
    if(response.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<DocumentsTypeModel> getDocumentsType() async{
    final response = await dio.get("$BASE_URL_$GET_DOCUMENTS_TYPE_",options: DioOptionUtils().options);
    if(response .  statusCode == 200){
      return DocumentsTypeModel.fromJson(response.data);

    }else {
      throw ServerException();
    }
  }

  @override
  Future<UserDetailsModel> getUserDetails(int userId) async{
    final data = {
      "user_id":userId
    };
    final response = await dio.post("$BASE_URL_$GET_DETAILS_",data: data,options: DioOptionUtils().options);
    log(response.toString());
    if(response.statusCode == 200){
      return UserDetailsModel.fromJson(response.data);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<UserDocumentsModel> getUserDocuments(int userId) async{
   final data = {
     "user_id":userId
   };
   final response = await dio.get("$BASE_URL_$GET_DOCUMENTS_",data: data,options: DioOptionUtils().options);
   if(response.statusCode == 200){
     return UserDocumentsModel.fromJson(response.data);
   }else{
     throw ServerException();
   }
  }

  @override
  Future<Unit> addDocument(DocumentParam param)async {
    final data = await param.toJson();

   final response = await dio.post("$BASE_URL_$STORE_DOCUMENTS_",data: data,options: DioOptionUtils().options);
   log(response.toString());
   if(response.statusCode == 201){
     return Future.value(unit);
   }else{
     throw ServerException();
   }
  }

  @override
  Future<Unit> deleteDocument(int documentId) async{
    final data = {
      "document_id":documentId,
    };
    log("id : ${documentId}");
final response = await dio.post("$BASE_URL_$DELETE_DOCUMENT_",data: data,options: DioOptionUtils().options);
log(response.toString());

    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> modifyDocument(DocumentParam param, int documentId)async {
    final data = await param.toJsonModify(documentId);

    final response = await dio.post("$BASE_URL_$MODIFY_DOCUMENT_",data: data,options: DioOptionUtils().options);
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }
}