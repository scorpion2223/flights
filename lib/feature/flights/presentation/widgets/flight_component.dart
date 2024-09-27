import 'package:dio/dio.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/public/feature/contacts/presentation/pages/contacts_screen.dart';
import 'package:flightes/core/public/feature/travelers/presentation/manager/cubits/get_travelers/get_travelers_cubit.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/announcements/presntation/pages/announcements_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/public/feature/travelers/data/data_sources/remote/travelers_remote_data_source.dart';
import '../../../../core/public/feature/travelers/data/data_sources/repositories/travelers_repository_impl.dart';
import '../../../../core/public/feature/travelers/domain/usecases/get_travelers_use_case.dart';
import '../../domain/entities/flights_offers_with_pricing_entity.dart';
class FlightComponent extends StatelessWidget{
  final FlightOffer flight;
  final double width;
  final double height;
  final SearchParam param;


  const FlightComponent({super.key, required this.flight, required this.width, required this.height, required this.param});
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (context) => GetTravelersCubit(
              useCase: GetTravelersUseCase(
                  repository : TravelersRepositoryImpl(
                      dataSource:
                      TravelersRemoteDataSourceWithDio(dio: Dio())))),
      child: BlocConsumer<GetTravelersCubit,GetTravelersState>(
        listener: (context,state){
          if( state is GetTravelersSuccess){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsScreen(param: param, entity: state.entity)));

          }
          if( state is GetTravelersEmpty){
            ScaffoldMessageUtil().customScaffoldMessenger(context, "empty", Colors.green);

          } if( state is GetTravelersFailed) {
            ScaffoldMessageUtil().customScaffoldMessenger(context, "failed", Colors.red);
          }
        },
        builder: (context,state){
          return InkWell(
            onTap: (){
               context.read<GetTravelersCubit>()..getTravelers();

            },
            child:  Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orange1,style: BorderStyle.solid,width: (width/4)*(0.02)),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: height,
                child:Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width/4,
                        height: height/1.2,
                        decoration: BoxDecoration(
                          color: AppColors.blue2,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft:  Radius.circular(10)),
                        ),

                        child:Text("${flight.type}",
                            style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold)),
                      ),
                      Expanded(child:     Container(

                        height: height/1.2,

                        child: Column(children: [
                          Center(child: Text("Source : ${flight.source}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //   Text("${flight.itineraries!.first.segments!.first.departure!.iataCode!.name}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_right_alt_sharp),
                              Text("${flight.itineraries!.first.segments!.last.duration}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${ DateFormat('yyyy-MM-dd').format(flight.itineraries!.first.segments!.first.departure!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                              Text("${DateFormat('yyyy-MM-dd').format(flight.itineraries!.first.segments!.first.arrival!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${ DateFormat('HH:mm:ss t').format(flight.itineraries!.first.segments!.first.departure!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                              Text("${DateFormat('HH:mm:ss').format(flight.itineraries!.first.segments!.first.arrival!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                            ],),

                          Expanded(child: SizedBox()),
                          Container(

                            height: height/3.5,
                            width: double.infinity,
                            color: AppColors.blue2.withOpacity(0.5),
                            child: Column(children: [
                              Center(child: Text("Total Price: ${flight.price!.total.toString()} ",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),)),
                              Center(child: Text(" ${flight.price!.currency!.name.toString()} ",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),)),


                            ],),
                          ),
                          SizedBox(height: height/30,)

                        ],),
                      )),

                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AnnouncementsScreen(flightId:int.parse(flight.id!))));
                    }, icon: Icon(Icons.announcement)),

                  ],),
                ],)),
          );
        },
      ),);

  }

}

/**/