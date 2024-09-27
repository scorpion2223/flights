import 'package:dio/dio.dart';
import 'package:flightes/core/errors/exceptions.dart';
import 'package:flightes/core/public/feature/contacts/data/models/contacts_model.dart';
import 'package:flightes/core/utils/constatnts/network_url.dart';
import 'package:flightes/core/utils/dio_option_utils.dart';

import '../../../../../../../main.dart';
import '../../../domain/entities/contacts_entity.dart';

abstract class ContactsRemoteDataSource{
  Future<ContactsModel> getContacts();
}

class ContactsRemoteDataSourceWithDio implements ContactsRemoteDataSource{
  final Dio dio;

  ContactsRemoteDataSourceWithDio({required this.dio});
  @override
  Future<ContactsModel> getContacts()async {
    final response = await dio.get("${NetworkUrl.baseUrl}contacts",data: {"user_id":userID},options: DioOptionUtils().options);
    if(response.statusCode == 200){
      return ContactsModel.fromJson(response.data);
    }else{
      throw ServerException();
    }
  }

}