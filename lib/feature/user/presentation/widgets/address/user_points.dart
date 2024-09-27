

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main.dart';
import '../../../data/data_source/remote/user_remote_data_source.dart';
import '../../../data/repositories/user_repository_impl.dart';
import '../../../domain/usecases/get_points_use_case.dart';
import '../../manager/cubits/get_points/get_points_cubit.dart';



class UserPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPointsCubit(
          useCase: GetPointsUseCase(
              userRepository: UserRepositoryImpl(
                  userRemoteDataSource:
                  UserRemoteDataSourceWithDio(dio: Dio()))))..getPoints(userID!),
      child: BlocConsumer<GetPointsCubit,GetPointsState>(
        listener: (context,state){

        },
        builder: (context,state){
          if(state is GetPointsLoading){

            return const Center(child: CircularProgressIndicator(color: Colors.green,),);
          }
          if(state is GetPointsSuccess){

            return   Text("points : ${state.entity.points!}");
          }
          return const Center();
        },
      ),);
  }
}
