import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/public/feature/iata_codes/data/models/iata_codes_model.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.getCodesApiKey;
abstract class IataCodesRemoteDataSource{
  Future<IataCodesModel> getCodes();
}

class IataCodesRemoteDataSourceWithDio implements IataCodesRemoteDataSource{
  final Dio dio;

  IataCodesRemoteDataSourceWithDio({required this.dio});
  @override
  Future<IataCodesModel> getCodes() async {
    dio.options.connectTimeout = Duration(seconds: 15);

 try{


   final response = await dio.get("$BASE_URL_$GET",options: Options());
   log(response.data.toString());

   if(response.statusCode==200){
     log(response.data.toString());
     return IataCodesModel.fromJson(response.data);
   }else{
     throw ServerException();
   }} catch (e){
   log(e.toString());
   throw ServerException();
 }
  }

}