import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/params/air_porst_param.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../models/air_ports_model.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;

const String GET = NetworkUrl.getAirPortsApiKey;

abstract class AirPortsRemoteDataSource{
  Future<AirPortsModel> getAirPorts(AirPortsParam param);
}

class AirPortsRemoteDataSourceWithDio implements AirPortsRemoteDataSource{
  final Dio dio;

  AirPortsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<AirPortsModel> getAirPorts(AirPortsParam param) async{
    final data = param.toJson();
    final response = await dio.get("$BASE_URL_$GET",data: data,options: DioOptionUtils().options);
   if(response.statusCode == 200){
     log("Airports : ${response.data}");
     return AirPortsModel.fromJson(response.data);

   }else {
     throw ServerException();
   }
  }

}