import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flightes/core/public/feature/iata_codes/data/data_sources/remote/iata_codes_remote_data_source.dart';
import 'package:flightes/core/public/feature/iata_codes/data/repositories/iata_codes_repository_impl.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/usecases/get_iata_codes_use_case.dart';
import 'package:flightes/core/public/feature/iata_codes/presentaion/manager/cubits/iata_codes/get_iata_codes_cubit.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/air_porst/presentation/pages/air_porst_home_screen.dart';
import 'package:flightes/feature/announcements/presntation/pages/announcements_screen.dart';
import 'package:flightes/feature/auth/presentation/pages/login_screen.dart';
import 'package:flightes/feature/flights/presentation/pages/insert_offers_information_screen.dart';
import 'package:flightes/feature/hotels/presentation/pages/hotels_home_screen.dart';
import 'package:flightes/feature/payment/presentation/pages/payment_screen.dart';
import 'package:flightes/feature/user/presentation/pages/add_address_screen.dart';
import 'package:flightes/feature/user/presentation/pages/add_document_screen.dart';
import 'package:flightes/feature/user/presentation/pages/profile_home_screen.dart';
import 'package:flightes/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flightes/core/config/injections/injections.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/public/feature/travelers/data/data_sources/remote/travelers_remote_data_source.dart';
import 'core/public/feature/travelers/data/data_sources/repositories/travelers_repository_impl.dart';
import 'core/public/feature/travelers/domain/usecases/get_travelers_use_case.dart';
import 'core/public/feature/travelers/presentation/manager/cubits/get_travelers/get_travelers_cubit.dart';

String? token;
int? userID;

SharedPreferences? shared_preferences;
String?fcMToken;
Dio dio = Dio();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  shared_preferences = await SharedPreferences.getInstance();

  token = di.obj<SharedPreferences>().getString("token");
  userID = di.obj<SharedPreferences>().getInt("id");
  log("\n"
      "token : $token\n"
      "userId : $userID");
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB3atTBYe-zzs8RRuoZUc5hOM4ujI9VBFk",
          appId: "1:1094121220135:android:7d454772a6c71151ad4602",
          messagingSenderId: "1094121220135",
          projectId: "flights-a86cd"))
      : await Firebase.initializeApp();

  await FirebaseMessaging.instance.requestPermission();
  fcMToken = await FirebaseMessaging.instance.getToken();
  log('FCMToken:${fcMToken}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GetTravelersCubit(
                  useCase: GetTravelersUseCase(
                     repository : TravelersRepositoryImpl(
                          dataSource:
                              TravelersRemoteDataSourceWithDio(dio: Dio()))))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            inputDecorationTheme:  InputDecorationTheme(
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.blue2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.blue2),
              ),

            ),
            appBarTheme: const AppBarTheme(
                color: AppColors.blue2,
                titleTextStyle:
                    TextStyle(color: AppColors.orange2, fontSize: 20)),
          ),
          home: token == null ? const LoginScreen() : AnnouncementsScreen(flightId: 1),
        ));
  }
}
