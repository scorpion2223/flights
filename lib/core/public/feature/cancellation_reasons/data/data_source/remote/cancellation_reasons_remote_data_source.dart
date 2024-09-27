import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../models/cancellations_reasons_model.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;

const String GET = NetworkUrl.getCancellationReasons;

abstract class CancellationReasonsRemoteDataSource{
  Future<CancellationsReasonsModel> getData();

}

class CancellationReasonsRemoteDataSourceWithDio implements CancellationReasonsRemoteDataSource{
  final Dio dio;

  CancellationReasonsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<CancellationsReasonsModel> getData() async{
  final response = await dio.get("$BASE_URL_$GET",options: DioOptionUtils().options);
  if(response . statusCode ==200){
    return CancellationsReasonsModel.fromJson(response.data);

  }else {
    throw ServerException();
  }
  }

}