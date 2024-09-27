import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../models/country_model.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.getCountriesApiKey;


abstract class CountryRemoteDataSource{
  Future<CountryModel> getCountries();
}

class CountryRemoteDataSourceWithDio implements CountryRemoteDataSource{
  final Dio dio;

  CountryRemoteDataSourceWithDio({required this.dio});
  @override
  Future<CountryModel> getCountries() async{
    final response = await dio.get("$BASE_URL_$GET",options: DioOptionUtils().options);
    if(response.statusCode==200){
      return CountryModel.fromJson(response.data);
    }else{
      throw ServerException();
    }


  }

}