import 'package:dio/dio.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/feature/flights/data/data_sources/remote/flights_remote_data_source.dart';
import 'package:flightes/feature/flights/data/repositories/flights_repository_impl.dart';
import 'package:flightes/feature/flights/domain/usecases/get_flights_offer_use_case.dart';
import 'package:flightes/feature/flights/presentation/manager/cubits/get_flights_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/flights_offers_with_pricing_entity.dart';
import '../widgets/flight_component.dart';

class FlightsOfferScreenTest extends StatelessWidget {
  final SearchParam param;

  const FlightsOfferScreenTest({super.key, required this.param});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Flight Offers"),),
      body: BlocProvider(
        create: (context) {
          return GetFlightsOfferCubit(
              getFlightsOfferUseCase: GetFlightsOfferUseCase(
                  flightsRepository: FlightsRepositoryImpl(
                      flightsRemoteDataSource:
                          FlightsRemoteDataSourceWithDio(dio: Dio()))),
              param: param)..getOffers();
        },
        child:  BlocConsumer<GetFlightsOfferCubit,GetFlightsOfferState>(
          listener: (context,state){},
          builder: (context,state){
            if(state is GetFlightsOfferSuccess){
              return Center(child:  Container(

                width: width/1.2,
                height: height/1.2,
                child: listFlights(state.entity.data!.original!.data!.flightOffers!,width/1.2,height/5),
              ));
            }
            if(state is GetFlightsOfferEmpty){
              return Center(child:Text(state.message,style: const TextStyle(fontSize: 30,color: Colors.red),));
            }if(state is GetFlightsOfferFailedExternalServer){
              return Center(child:  Text(state.message,style: const TextStyle(fontSize: 30,color: Colors.green),),);
            }if(state is GetFlightsOfferFailed){
              return Center(child:  Text(state.message,style: const TextStyle(fontSize: 30,color: Colors.green),),);
            }if(state is GetFlightsOfferLoading){
              return const Center(child: CircularProgressIndicator(color: Colors.green,),);
            }
            return Center();
          },
        ),
      ),
    );
  }
  Widget listFlights(List<FlightOffer> list,double width,double height){
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index)=>Padding(padding: const EdgeInsets.symmetric(vertical: 10),child:FlightComponent(flight: list[index],width: width,height: height,param: param,)));
  }
}
