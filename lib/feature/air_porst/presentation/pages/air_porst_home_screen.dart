import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/public/feature/country_codes/presentation/widgets/country_code_form.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/air_porst/data/data_source/remote/air_ports_remote_data_source.dart';
import 'package:flightes/feature/air_porst/data/repositories/air_ports_repository_impl.dart';
import 'package:flightes/feature/air_porst/domain/usecases/get_air_ports_use_case.dart';
import 'package:flightes/feature/air_porst/presentation/manager/cubits/get_air_ports/get_air_ports_cubit.dart';
import 'package:flightes/feature/air_porst/presentation/widgets/air_port_component.dart';
import 'package:flightes/feature/air_porst/presentation/widgets/keyword_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/air_ports_entity.dart';

class AirPorstHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AirPorstHomeScreen();
  }
}

class _AirPorstHomeScreen extends State<AirPorstHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airports"),
      ),
      body: BlocProvider(
        create: (context) {
          return GetAirPortsCubit(
              getAirPortsUseCase: GetAirPortsUseCase(
                  airPortsRepository: AirPortsRepositoryImpl(
                      airPortsRemoteDataSource:
                          AirPortsRemoteDataSourceWithDio(dio: Dio()))))
            ..getAirPorts();
        },
        child: BlocConsumer<GetAirPortsCubit, GetAirPortsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return  RefreshIndicator(child: Column(

              children: [
                SizedBox(
                  height: height / 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "City",
                          style: TextStyle(color: AppColors.orange1),
                        ),
                        KeyWordForm(
                            height: height,
                            listWidth: width,
                            listHeight: height,
                            onIataCodesChanged: (value) {
                              context.read<GetAirPortsCubit>().param.keyword =
                                  value.code;
                              setState(() {});
                              log(context
                                  .read<GetAirPortsCubit>()
                                  .param
                                  .keyword
                                  .toString());
                            },
                            param: context.read<GetAirPortsCubit>().param)
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "country",
                          style: TextStyle(color:  AppColors.orange1),
                        ),
                        CountryCodeForm(
                            height: height,
                            listWidth: width,
                            listHeight: height,
                            onCountryCodesChanged: (value) {
                              context.read<GetAirPortsCubit>().param.countryCode =
                                  value.code;
                              setState(() {});
                              log(context
                                  .read<GetAirPortsCubit>()
                                  .param
                                  .keyword
                                  .toString());
                            },
                            param: context.read<GetAirPortsCubit>().param)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 30,
                ),
                IconButton(onPressed: (){
                  context.read<GetAirPortsCubit>().getAirPorts();
                }, icon: Icon(Icons.search,color:  AppColors.blue2,size: 50,)),
                SizedBox(
                  height: height / 30,
                ),
                (state is GetAirPortsSuccess)
                    ? Center(
                    child: Container(
                      width: width / 1.2,
                      height: height / 2,
                      child: listAirPorts(state.entity.original!.data!,width/1.2,height/5),
                    ))
                    : (state is GetAirPortsEmpty)
                    ? Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(fontSize: 30,color: Colors.red),
                    ))
                    : (state is GetAirPortsFailedExternalServer)
                    ? Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 30),
                  ),
                )
                    : (state is GetAirPortsFailed)
                    ? Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 30),
                  ),
                )
                    : (state is GetAirPortsLoading)
                    ? const Center(
                  child: CircularProgressIndicator(
                    color:  AppColors.blue2,
                  ),
                )
                    : const Center(),
              ],
            ), onRefresh: ()async{
              context.read<GetAirPortsCubit>().getAirPorts();

            });
          },
        ),
      ),
    );
  }

  Widget listAirPorts(List<Datum> list,double width,double height) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AirPortComponent(
              airPort: list[index],
              width: width,
              height: height,
            )));
  }
}
