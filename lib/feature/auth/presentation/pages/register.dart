import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/auth/presentation/pages/login_screen.dart';
import 'package:flightes/feature/auth/presentation/widgets/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/remote/auth_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../manager/cubits/auth_cubit.dart';

class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
   return _Register();
  }

}

class _Register extends State<Register>{
  final GlobalKey<FormState>  formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account !"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 30, vertical: height / 50),
          child: Center(child:SingleChildScrollView(
              child:BlocProvider(create: (context){
                return AuthCubit(registerUseCase: RegisterUseCase(
                    authRepository: AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio()))),
                    logoutUseCase: LogoutUseCase(authRepository:  AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio()))),
                    loginUseCase: LoginUseCase(authRepository:  AuthRepositoryImpl(authRemoteDataSource: AuthDataSourceWithDio(dio: Dio()))));


              },
                child:  BlocConsumer<AuthCubit,AuthState>(
                  listener: (context,state){
                    if(state is AuthSuccess){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("register success"),backgroundColor: Colors.green,));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                    if(state is AuthFailed){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message),backgroundColor: Colors.red,));
                    }

                  },
                  builder: (context,state){
                    return  Column(
                        children: [
                          Container(
                            width: width,
                            height: height/5,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
                          ),
                         Padding(padding: EdgeInsets.symmetric(horizontal: width/30),child:  RegisterForm(
                              formState: formState,
                              param: context.read<AuthCubit>().param,
                              onChanged: (value){
                                context.read<AuthCubit>().param = value;
                                setState(() {

                                });

                              })),

                          TextButton(onPressed: (){
                            bool isValid = formState.currentState!.validate();
                            if(isValid){
                            context.read<AuthCubit>().register();}
                          }, child: (state is AuthLoading)?CircularProgressIndicator():Text("register",style: TextStyle(color:AppColors.orange1,fontSize: 20),)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Have account?"),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              },child: const Text("login",style: TextStyle(color: AppColors.orange1,fontSize: 20),),),
                            ],),


                        ]);



                  },
                ),
              )

          ))),
    );
  }

}