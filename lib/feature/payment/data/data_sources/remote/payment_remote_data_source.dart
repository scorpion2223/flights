import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../../../../core/params/payment_param.dart';
import '../../../domain/entities/payment_entity.dart';
import '../../models/payment_model.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String START = NetworkUrl.paymentStartApiKey;
const String COMPLETE = NetworkUrl.paymentCompleteApiKey;

abstract class PaymentRemoteDataSource{
  Future<PaymentModel> startPayment(PaymentParam param);
  Future<Unit> completePayment(PaymentEntity param);
}

class PaymentRemoteDataSourceWithDio implements PaymentRemoteDataSource{
  final Dio dio;

  PaymentRemoteDataSourceWithDio({required this.dio});
  @override
  Future<Unit> completePayment(PaymentEntity param) async{
    final data = param.toJson();
    final response = await dio.post("$BASE_URL_$COMPLETE",options: DioOptionUtils().options,data: data);
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<PaymentModel> startPayment(PaymentParam param) async{
   final data = param.toJson();
   final response = await dio.post("$BASE_URL_$START",options: DioOptionUtils().options,data: data);
   log(response.toString());
   if(response.statusCode == 200){
     return PaymentModel.fromJson(response.data);
   }else{
     throw ServerException();
   }
  }

}