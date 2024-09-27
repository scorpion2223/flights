import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:flightes/main.dart';

import '../../models/travelers_model.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.getTravelersApiKey;
abstract class TravelersRemoteDataSource{
  Future<TravelersModel> getTravelers();
}

class TravelersRemoteDataSourceWithDio extends TravelersRemoteDataSource{
  final Dio dio;

  TravelersRemoteDataSourceWithDio({required this.dio});
  @override
  Future<TravelersModel> getTravelers() async {
   final response = await dio.get("$BASE_URL_$GET$userID",options: DioOptionUtils().options);
   if(response.statusCode == 200){
     log(response.data.toString());
     return TravelersModel.fromJson(response.data);
   }else
     {
       throw ServerException();
     }
  }

}