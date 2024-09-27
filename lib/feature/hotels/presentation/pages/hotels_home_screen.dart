import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/hotels/presentation/widgets/city_codes_form.dart';
import 'package:flightes/feature/hotels/presentation/widgets/hotel_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/remote/hotels_remote_data_source.dart';
import '../../data/repositories/hotels_repository_impl.dart';
import '../../domain/entities/hotels_entity.dart';
import '../../domain/usecases/get_hotels_use_case.dart';
import '../manager/cubits/get_hotels/get_hotels_cubit.dart';

class HotelsHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HotelsHomeScreen();
  }
}

class _HotelsHomeScreen extends State<HotelsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels"),
      ),
      body: BlocProvider(
        create: (context) {
          return GetHotelsCubit(
              getHotelsUseCase: GetHotelsUseCase(
                  hotelsRepository: HotelsRepositoryImpl(
                      hotelsRemoteDataSource:
                          HotelsRemoteDataSourceWithDio(dio: Dio()))))
            ..getHotels();
        },
        child: BlocConsumer<GetHotelsCubit, GetHotelsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("city code",style: TextStyle(color: AppColors.orange1,fontSize: 20),),
                    CityCodeForm(
                        height: height,
                        listWidth: width,
                        listHeight: height,
                        onIataCodesChanged: (value) {
                          context.read<GetHotelsCubit>().param.cityCode =
                              value.code;

                          setState(() {
                            log(context
                                .read<GetHotelsCubit>()
                                .param
                                .cityCode
                                .toString());
                          });
                        },
                        param: context.read<GetHotelsCubit>().param),
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                IconButton(onPressed: (){
                  context.read<GetHotelsCubit>().getHotels();
                }, icon: Icon(Icons.filter_alt_outlined,color: AppColors.blue2,size: 50,)),
                SizedBox(
                  height: height / 20,
                ),


                (state is GetHotelsSuccess)
                    ? Center(
                        child: Container(
                        width: width / 1.2,
                        height: height / 1.8,
                        child: listHotels(state.entity.original!.data!,width,height),
                      ))
                    : (state is GetHotelsEmpty)
                        ? Center(
                            child: Text(
                            state.message,
                            style: TextStyle(fontSize: 30,color: Colors.red),
                          ))
                        : (state is GetHotelsFailedExternalServer)
                            ? Center(
                                child: Text(
                                  state.message,
                                  style: TextStyle(fontSize: 50),
                                ),
                              )
                            : (state is GetHotelsFailed)
                                ? Center(
                                    child: Text(
                                      state.message,
                                      style: TextStyle(fontSize: 50),
                                    ),
                                  )
                                : (state is GetHotelsLoading)
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.blue2,
                                        ),
                                      )
                                    : const Center(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget listHotels(List<Datum> list,double width,double height) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: HotelComponent(
              hotel: list[index],
              width: width/1.2,
              height: height/5,
            )));
  }
}
