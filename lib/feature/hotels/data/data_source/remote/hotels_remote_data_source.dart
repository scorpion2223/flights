import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/params/hotels_param.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../models/hotels_model.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.getHotelsApiKey;


abstract class HotelsRemoteDataSource{
  Future<HotelsModel> getHotels(HotelsParam param);

}

class HotelsRemoteDataSourceWithDio implements HotelsRemoteDataSource{
  final Dio dio;

  HotelsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<HotelsModel> getHotels(HotelsParam param) async{
    final data = param.toJson();
  try{ final response = await dio.get("$BASE_URL_$GET",data: data,options: DioOptionUtils().options);
   if(response.statusCode == 200){
     return HotelsModel.fromJson(response.data);
   }else{
     throw ServerException();
   }
  }catch (e){
    throw UnExpictedException();
  }

  }

}