import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flightes/feature/announcements/data/data_sources/remote/announcements_remote_data_source.dart';
import 'package:flightes/feature/announcements/data/repositories/announcements_repository_impl.dart';
import 'package:flightes/feature/announcements/domain/repositories/announcements_repository.dart';
import 'package:flightes/feature/announcements/domain/usecases/announcement_trip_use_case.dart';
import 'package:flightes/feature/announcements/presntation/widgets/announcement_choose_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubits/announcement_trip/announcement_trip_cubit.dart';

class AnnouncementsScreen extends StatefulWidget{
  final int flightId;

  const AnnouncementsScreen({super.key, required this.flightId});
  @override
  State<StatefulWidget> createState() {
    return _AnnouncementsScreen();
  }

}
class _AnnouncementsScreen extends State<AnnouncementsScreen>{

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Announcements"),),
      body:BlocProvider(
        create: (context){
          return AnnouncementTripCubit(

              useCase: AnnouncementTripUseCase(repository: AnnouncementsRepositoryImpl(remoteDataSource: AnnouncementsRemoteDataSourceWithDio(dio: Dio()))))..param.flightId=widget.flightId;

        },
        child:  BlocConsumer<AnnouncementTripCubit,AnnouncementTripState>(
          listener: (context,state){
            if(state is AnnouncementTripSuccess){
              ScaffoldMessageUtil().customScaffoldMessenger(context, "success", Colors.green);
            }

          },
          builder: (context,state){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height/5,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 Padding(padding: EdgeInsets.symmetric(horizontal: width/10),
                     child:  Text("Please Choose The Announcement Reason And Send It!",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold,fontSize: 20),)),
                 SizedBox(height: height/8,),
                  AnnouncementChooseForm(
                      height: height, listWidth: width, listHeight: height,
                      onAnnouncementsChanged: (value){
                        context.read<AnnouncementTripCubit>().param.announcementId = value.id;
                        setState(() {
                          log(context.read<AnnouncementTripCubit>().param.announcementId.toString());
                          log(context.read<AnnouncementTripCubit>().param.flightId.toString());
                        });
                      }, param: context.read<AnnouncementTripCubit>().param),
                ],),


                TextButton(
                    style: TextButton.styleFrom(backgroundColor: AppColors.orange2),
                    onPressed: (){
                  context.read<AnnouncementTripCubit>().announcementsTrip();

                }, child: (state is AnnouncementTripLoading)?CircularProgressIndicator():Text("Send Announcement",style: TextStyle(color: AppColors.white),))

              ],
            );
          },
        ),
      ),
    );
  }

}