import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/auth/data/data_sources/remote/auth_data_source.dart';
import 'package:flightes/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:flightes/feature/auth/domain/usecases/login_use_case.dart';
import 'package:flightes/feature/auth/domain/usecases/logout_use_case.dart';
import 'package:flightes/feature/auth/domain/usecases/register_use_case.dart';
import 'package:flightes/feature/auth/presentation/manager/cubits/auth_cubit.dart';
import 'package:flightes/feature/auth/presentation/pages/register.dart';
import 'package:flightes/feature/auth/presentation/widgets/login_form.dart';
import 'package:flightes/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flightes/core/config/injections/injections.dart' as di;
import '../../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:  AppBar(
        title: Text('Welcome Back!'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 30, vertical: height / 50),
          child: Center(child:SingleChildScrollView(
            child:BlocProvider(create: (context){
              return AuthCubit(registerUseCase: RegisterUseCase(
                  authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio(BaseOptions(
                    connectTimeout: const Duration(seconds: 10), // 10 seconds
                    receiveTimeout: const Duration(seconds: 10), // 10 seconds
                  ))))),
                  logoutUseCase: LogoutUseCase(authRepository:  AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio(
                      BaseOptions(
                        connectTimeout: const Duration(seconds: 10), // 10 seconds
                        receiveTimeout: const Duration(seconds: 10), // 10 seconds
                      )
                  )))),
                  loginUseCase: LoginUseCase(authRepository:  AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio(
                      BaseOptions(
                        connectTimeout: const Duration(seconds: 10), // 10 seconds
                        receiveTimeout: const Duration(seconds: 10), // 10 seconds
                      )
                  )))));


            },
              child:  BlocConsumer<AuthCubit,AuthState>(
                listener: (context,state){
                  if(state is AuthFailed){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message),backgroundColor: Colors.red,));
                  }
                  if(state is AuthSuccess){
                    userID =  di.obj<SharedPreferences>().getInt("id");

Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }

                },
                builder: (context,state){
                  return
                    Column(




                      children: [
                        Container(
                          width: width,
                          height: height/5,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
                        ),
                        LoginForm(
                            formState: formState,
                            param: context.read<AuthCubit>().param,
                            onChanged: (value){
                              context.read<AuthCubit>().param = value;
                              setState(() {

                              });

                            }),

                      TextButton(onPressed: (){
                        context.read<AuthCubit>().login();
                      }, child: (state is AuthLoading)?const CircularProgressIndicator():const Text("login",style: TextStyle(color: AppColors.orange1,fontSize: 20),)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Text("create account?"),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register()));
                        },child: const Text("register",style: TextStyle(color: AppColors.orange1,fontSize: 20),),),
                      ],),


                      ]);

                },
              ),
            )

          )),
    ));
  }
}

/*
*  Column(
              children: [
                LoginForm(
                    formState: formState,
                    param: param,
                    onChanged: onChanged)])*/
