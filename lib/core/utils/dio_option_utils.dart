import 'dart:developer';
import 'package:flightes/core/config/injections/injections.dart' as di;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioOptionUtils {

  final Options options = Options(


      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${di.obj<SharedPreferences>().getString("token")}'
      },



      responseType: ResponseType.json,
      validateStatus: (statusCode) {
        if (statusCode == null) {
          log("status code null");
          return false;
        }
        if (statusCode == 422) {
          log("status code 422"); // your http status code
          return true;
        }
        if (statusCode == 404) {
          log("status code 404"); // your http status code
          return true;
        }
        if (statusCode == 401) {
          log("status code 401"); // your http status code
          return true;
        }
        if (statusCode == 405) {
          log("status code 405"); // your http status code
          return true;
        }
        if (statusCode == 500) {
          log("status code 500"); // your http status code
          return true;
        } else {
          log("status code 200=>300");
          return statusCode >= 200 && statusCode < 300;
        }
      });
}
