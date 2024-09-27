import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../models/cities_model.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;

const String GET = NetworkUrl.getCitiesApiKey;


abstract class CitiesRemoteDataSource{
Future<CitiesModel> getCities();
}

class CitiesRemoteDataSourceWithDio implements CitiesRemoteDataSource{
  final Dio dio;

  CitiesRemoteDataSourceWithDio({required this.dio});
  @override
  Future<CitiesModel> getCities() async{
  final response = await dio.get("$BASE_URL_$GET",options: DioOptionUtils().options);
  if(response.statusCode == 200){
    return CitiesModel.fromJson(response.data);
  }
  else{
    throw ServerException();
  }
  }

}