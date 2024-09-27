import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/params/announcements_param.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';
import 'package:flightes/main.dart';

import '../../models/announcements_model.dart';

const String BASE_URL_ = NetworkUrl.baseUrl;
const String GET = NetworkUrl.announcementsGetListApiKey;
const String announcementTrip = NetworkUrl.announcementTripApiKey;


abstract class AnnouncementsRemoteDataSource{
  Future<AnnouncementsModel> getAnnouncements();
  Future<Unit> AnnouncementTrip(AnnouncementsParam param);
  
  

}

class AnnouncementsRemoteDataSourceWithDio implements AnnouncementsRemoteDataSource{
  final Dio dio;

  AnnouncementsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<Unit> AnnouncementTrip(AnnouncementsParam param)async {
    final data = param.toJson();
   final response = await dio.post("$BASE_URL_$announcementTrip",data: data,options: DioOptionUtils().options);
   if(response . statusCode == 200){
     return Future.value(unit);
   }else{
     throw ServerException();
   }
  }

  @override
  Future<AnnouncementsModel> getAnnouncements() async{
   
    final response = await dio.get("$BASE_URL_$GET",options: DioOptionUtils().options);
    if(response . statusCode == 200){
      return AnnouncementsModel.fromJson(response.data);
    }else{
      throw ServerException();
    }
  }
  
}