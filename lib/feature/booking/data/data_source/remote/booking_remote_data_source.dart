import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/params/booking_param.dart';
import 'package:flightes/core/params/custom_booking_param.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../../../../core/params/cancellation_booking_param.dart';
import '../../../domain/entities/booking_entity.dart';
import '../../../domain/entities/one_flight_offer_entity.dart';
const String BASE_URL_ = NetworkUrl.baseUrl;
const String STORE = NetworkUrl.bookingStoreApiKey;

abstract class BookingRemoteDataSource{
Future<Unit> storeBooking(CustomBookingParam param);
Future<Unit> cancelBooking(CancellationBookingParam param);
Future<BookingEntity> getAllBookingForUser(int userId);
Future<OneFlightOfferEntity> getFlightOfferById(int offerId);
Future<Unit> modifyBooking(BookingParam param , int bookingId);

}

class BookingRemoteDataSourceWithDio implements BookingRemoteDataSource{
  final Dio dio;

  BookingRemoteDataSourceWithDio({required this.dio});

  @override
  Future<Unit> storeBooking(CustomBookingParam param) async{
    final data = await param.toJsonWithConstants();
    log(data.toString());
   try{ final response = await dio.get("${BASE_URL_}${STORE}",data: data,options: DioOptionUtils().options);
    if(response.statusCode == 200){
      if(response.data["data"]["original"]["error"]==null){
      log(response.data.toString());
      return Future.value(unit);}
      else{
        throw ServerException();
      }
    }else {
      throw ServerException();
    }}catch (e){
     log(e.runtimeType.toString());
     throw UnExpictedException();
   }
  }

  @override
  Future<Unit> cancelBooking(CancellationBookingParam param)async {
    // TODO: implement cancelBooking
    throw UnimplementedError();
  }

  @override
  Future<BookingEntity> getAllBookingForUser(int userId) async{
    // TODO: implement getAllBookingForUser
    throw UnimplementedError();
  }

  @override
  Future<OneFlightOfferEntity> getFlightOfferById(int offerId)async {
    // TODO: implement getFlightOfferById
    throw UnimplementedError();
  }

  @override
  Future<Unit> modifyBooking(BookingParam param, int bookingId) async{
    // TODO: implement modifyBooking
    throw UnimplementedError();
  }
}