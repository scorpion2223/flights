import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:flightes/main.dart';

import '../../models/country_code_model.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.getCountryCodesApiKey;

abstract class CountryCodesRemoteDataSource{
  Future<CountryCodeModel> getCodes();

}

class CountryCodesRemoteDataSourceWithDio implements CountryCodesRemoteDataSource{
  final Dio dio;

  CountryCodesRemoteDataSourceWithDio({required this.dio});
  @override
  Future<CountryCodeModel> getCodes()async {
   final response = await dio.get("$BASE_URL_$GET",options: DioOptionUtils().options);
   if(response.statusCode == 200){
     return CountryCodeModel.fromJson(response.data);

   }else{
     throw ServerException();
   }
  }

}