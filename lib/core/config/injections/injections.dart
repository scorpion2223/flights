
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final obj = GetIt.instance;

Future<void> init() async {
  //cubits

  final shared_preferences = await SharedPreferences.getInstance();

  obj.registerLazySingleton<SharedPreferences>(() => shared_preferences);

  //dio
  obj.registerLazySingleton(() => Dio());

}
