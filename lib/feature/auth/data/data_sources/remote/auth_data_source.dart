import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:flightes/core/config/injections/injections.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/params/user_param.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String LOGIN = NetworkUrl.loginApiKey;
const String LOGOUT = NetworkUrl.logoutApiKey;
const String REGISTER = NetworkUrl.registerApiKey;

abstract class AuthRemoteDataSource{
  Future<Unit> login(UserParam param);
  Future<Unit> register(UserParam param);
  Future<Unit> logout();
}

class AuthDataSourceWithDio implements AuthRemoteDataSource{
  final Dio dio ;

  AuthDataSourceWithDio({required this.dio});


  @override
  Future<Unit> login(UserParam param) async{

    final data ={
      'email': param.email,
      'password': param.password,
      'fcm_token': "hjfgf"
    };

    final response = await dio.post("$BASE_URL_$LOGIN",data: data,options: DioOptionUtils().options);
    log(response.data.toString());
    if(response.statusCode == 200){
      log(response.data.toString());
      di.obj<SharedPreferences>().setString("token", response.data['token']);
      di.obj<SharedPreferences>().setInt("id", response.data['user']['id']);

      log(di.obj<SharedPreferences>().getString("token").toString());


      log(response.data.toString());
      return Future.value(unit);
    }else {
      throw ServerException();
    }

  }

  @override
  Future<Unit> logout()async {

    final response = await dio.post("$BASE_URL_$LOGOUT",options: DioOptionUtils().options);
    if(response.statusCode == 200){
      di.obj<SharedPreferences>().remove("token");
      di.obj<SharedPreferences>().remove("id");
      return Future.value(unit);
    }else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> register(UserParam param) async{
    final data = param.toJsonRegister();
    final response = await dio.post("$BASE_URL_$REGISTER",data: data,options: DioOptionUtils().options);
    if(response.statusCode == 200){
      log(response.data.toString());
      return Future.value(unit);
    }else {
      throw ServerException();
    }
  }

}