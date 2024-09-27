import 'package:dio/dio.dart';
import 'package:flightes/core/public/feature/iata_codes/data/data_sources/remote/iata_codes_remote_data_source.dart';
import 'package:flightes/core/public/feature/iata_codes/data/repositories/iata_codes_repository_impl.dart';
import 'package:flightes/core/public/feature/iata_codes/domian/usecases/get_iata_codes_use_case.dart';
import 'package:flightes/core/public/feature/iata_codes/presentaion/manager/cubits/iata_codes/get_iata_codes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return GetIataCodesCubit(
              getIataCodesUseCase: GetIataCodesUseCase(
                  iataCodesRepository: IataCodesRepositoryImpl(
                      iataCodesRemoteDataSource:
                          IataCodesRemoteDataSourceWithDio(dio: Dio()))))..getCodes();
        },
        child: BlocConsumer<GetIataCodesCubit,GetIataCodesState>(
          listener: (context,state){

          },
          builder: (context,state){
            if(state is GetIataCodesLoading){
              return CircularProgressIndicator();
            }if(state is GetIataCodesSuccess){
              return Center(child: Text(state.entity.data![0].name!),);
            }
            return Center();
          },
        ),
      ),
    );
  }
}
