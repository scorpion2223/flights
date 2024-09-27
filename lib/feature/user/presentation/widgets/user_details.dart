import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/user/data/data_source/remote/user_remote_data_source.dart';
import 'package:flightes/feature/user/data/repositories/user_repository_impl.dart';
import 'package:flightes/feature/user/domain/usecases/get_user_details_use_case.dart';
import 'package:flightes/feature/user/presentation/manager/cubits/get_user_details/get_user_details_cubit.dart';
import 'package:flightes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetails extends StatelessWidget {
  final double width;
  final double height;

  const UserDetails({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetUserDetailsCubit(
            useCase: GetUserDetailsUseCase(
                userRepository: UserRepositoryImpl(
                    userRemoteDataSource:
                        UserRemoteDataSourceWithDio(dio: Dio()))))..getUserDetails(userID!),
    child: BlocConsumer<GetUserDetailsCubit,GetUserDetailsState>(
      listener: (context,state){

      },
      builder: (context,state){
        if(state is GetUserDetailsLoading){

          return const Center(child: CircularProgressIndicator(color: Colors.green,),);
        }
        if(state is GetUserDetailsSuccess){

          return   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${state.entity.userDetails!.first.name!}",style: TextStyle(color: AppColors.white,fontSize: 20),),
                  Text("${state.entity.userDetails!.first.email!}",style: TextStyle(color: AppColors.white,fontSize: 15),),
                  Text("points: ${state.entity.userDetails!.first.points!.toString()}",style: TextStyle(color: AppColors.white,fontSize: 20),),
                  Text("is active: ${state.entity.userDetails!.first.isActive}",style: TextStyle(color: AppColors.white,fontSize: 20),),





                ],);
        }
        return const Center();
      },
    ),);
  }
}
