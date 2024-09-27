import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:flightes/feature/flights/data/model/flights_model.dart';
import 'package:flightes/feature/flights/data/model/flights_offers_with_pricing_model.dart';

import '../../../../../core/params/search_param.dart';
import '../../../domain/entities/flights.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET_OFFERS_ = NetworkUrl.searchFlightOffersApiKey;


abstract class FlightsRemoteDataSource{
  Future<FlightsOffersWithPricingModel> getFlightsOffer(SearchParam param);
}

class FlightsRemoteDataSourceWithDio implements FlightsRemoteDataSource{
  final Dio dio;

  FlightsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<FlightsOffersWithPricingModel> getFlightsOffer(SearchParam param)
  async{
    final data = param.toJson();
  try{  final response = await dio.get("$BASE_URL_$GET_OFFERS_",options: DioOptionUtils().options,data: data);
    if(response.statusCode == 200){
      if(response.data['data']['original']['error']!=null){
       throw FieldFitchException();
     }
     log(response.data.toString());
     return FlightsOffersWithPricingModel.fromJson(response.data);
   }else{
     throw ServerException();
   }
  }catch (e){
    throw UnExpictedException();
  }

  }
}