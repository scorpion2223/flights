import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/auth/presentation/manager/cubits/auth_cubit.dart';
import 'package:flightes/feature/auth/presentation/pages/login_screen.dart';
import 'package:flightes/feature/user/presentation/pages/add_address_screen.dart';
import 'package:flightes/feature/user/presentation/pages/add_document_screen.dart';
import 'package:flightes/feature/user/presentation/widgets/address/user_points.dart';
import 'package:flightes/feature/user/presentation/widgets/user_details.dart';
import 'package:flightes/feature/user/presentation/widgets/user_documents.dart';
import 'package:flightes/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/data_sources/remote/auth_data_source.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/usecases/login_use_case.dart';
import '../../../auth/domain/usecases/logout_use_case.dart';
import '../../../auth/domain/usecases/register_use_case.dart';

class ProfileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          BlocProvider(
            create: (context) {
              return AuthCubit(
                  registerUseCase: RegisterUseCase(
                      authRepository: AuthRepositoryImpl(
                          authRemoteDataSource: AuthDataSourceWithDio(
                              dio: Dio(BaseOptions(
                    connectTimeout: const Duration(seconds: 10), // 10 seconds
                    receiveTimeout: const Duration(seconds: 10), // 10 seconds
                  ))))),
                  logoutUseCase: LogoutUseCase(
                      authRepository: AuthRepositoryImpl(
                          authRemoteDataSource: AuthDataSourceWithDio(
                              dio: Dio(BaseOptions(
                    connectTimeout: const Duration(seconds: 10), // 10 seconds
                    receiveTimeout: const Duration(seconds: 10), // 10 seconds
                  ))))),
                  loginUseCase: LoginUseCase(
                      authRepository: AuthRepositoryImpl(
                          authRemoteDataSource: AuthDataSourceWithDio(
                              dio: Dio(BaseOptions(
                    connectTimeout: const Duration(seconds: 10), // 10 seconds
                    receiveTimeout: const Duration(seconds: 10), // 10 seconds
                  ))))));
            },
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false);
                }
                if (state is AuthFailed) {
                  ScaffoldMessageUtil().customScaffoldMessenger(
                      context, "logout failed !", Colors.red);
                }
              },
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      // context.read<AuthCubit>().logout();
                    },
                    icon: (state is AuthLoading)
                        ? const CircularProgressIndicator()
                        :  Icon(Icons.notifications,color: AppColors.white,));
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height / 3.5,
              color: AppColors.blue2,
              child: Column(
                children: [
                  Container(
                    height: height / 8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bgc.png")),
                    ),
                  ),
                  UserDetails(width: width, height: height),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    icon: const Icon(Icons.home)),
                const Text("Home Screen"),

              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddDocumentScreen()));
                    },
                    icon: const Icon(Icons.file_upload)),
                const Text("upload document "),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAddressScreen()));
                    },
                    icon: const Icon(Icons.contacts)),
                const Text("Contacts "),
              ],
            ),

           Expanded(child: Center()),
            Row(
              children: [
                BlocProvider(
                  create: (context) {
                    return AuthCubit(
                        registerUseCase: RegisterUseCase(
                            authRepository: AuthRepositoryImpl(
                                authRemoteDataSource: AuthDataSourceWithDio(
                                    dio: Dio(BaseOptions(
                                      connectTimeout: const Duration(seconds: 10), // 10 seconds
                                      receiveTimeout: const Duration(seconds: 10), // 10 seconds
                                    ))))),
                        logoutUseCase: LogoutUseCase(
                            authRepository: AuthRepositoryImpl(
                                authRemoteDataSource: AuthDataSourceWithDio(
                                    dio: Dio(BaseOptions(
                                      connectTimeout: const Duration(seconds: 10), // 10 seconds
                                      receiveTimeout: const Duration(seconds: 10), // 10 seconds
                                    ))))),
                        loginUseCase: LoginUseCase(
                            authRepository: AuthRepositoryImpl(
                                authRemoteDataSource: AuthDataSourceWithDio(
                                    dio: Dio(BaseOptions(
                                      connectTimeout: const Duration(seconds: 10), // 10 seconds
                                      receiveTimeout: const Duration(seconds: 10), // 10 seconds
                                    ))))));
                  },
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                      }
                      if (state is AuthFailed) {
                        ScaffoldMessageUtil().customScaffoldMessenger(
                            context, "logout failed !", Colors.red);
                      }
                    },
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            context.read<AuthCubit>().logout();
                          },
                          icon: (state is AuthLoading)
                              ? const CircularProgressIndicator()
                              : const Icon(Icons.logout));
                    },
                  ),
                ),
                const Text("Logout"),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [

          const Text("My Documents",
              style: TextStyle(color: AppColors.orange2, fontSize: 30)),
          SizedBox(
            height: height / 20,
          ),
          UserDocuments(
            width: width,
            height: height / 1.5,
          ),
        ],
      ),
    );
  }
}
