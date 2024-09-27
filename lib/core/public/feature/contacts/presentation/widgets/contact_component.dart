import 'package:dio/dio.dart';
import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/public/feature/contacts/domain/entities/contacts_entity.dart';
import 'package:flightes/core/public/feature/contacts/presentation/pages/contacts_screen.dart';
import 'package:flightes/core/public/feature/travelers/presentation/manager/cubits/get_travelers/get_travelers_cubit.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/core/utils/scaffold_message_util.dart';
import 'package:flutter/material.dart';

class ContactComponent extends StatelessWidget{
  final Contact contact;
  final double width;
  final double height;



  const ContactComponent({super.key, required this.contact, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.orange1,style: BorderStyle.solid,width: (width/4)*(0.02)),
            borderRadius: BorderRadius.circular(10),
          ),
          width: width,
          height: height,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                width: width/4,
                height: height,
                decoration: BoxDecoration(
                  color: AppColors.blue2,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft:  Radius.circular(10)),
                ),

                child:Text("${contact.companyName}",
                    style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold)),
              ),
              Expanded(child:     Container(

                height: height,

                child: Column(children: [
                  Center(child: Text("city : ${contact.address!.cityName}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${contact.addresseeName!.firstName}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                      Text("${contact.addresseeName!.lastName}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${ contact.address!.cityName}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                      Text("${contact.address!.countryCode}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),

                    ],),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text("${ DateFormat('HH:mm:ss t').format(contact.itineraries!.first.segments!.first.departure!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),
                  //
                  //     Text("${DateFormat('HH:mm:ss').format(contact.itineraries!.first.segments!.first.arrival!.at!)}",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),
                  //
                  //   ],),

                  Expanded(child: SizedBox()),
                  Container(

                    height: height/3.5,
                    width: double.infinity,
                    color: AppColors.blue2.withOpacity(0.5),
                    child: Column(children: [
                      Center(child: Text("Phone: ${contact.phones!.first.number} ",style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),)),


                    ],),
                  ),
                  SizedBox(height: height/30,)

                ],),
              )),
            ],));

  }

}

/**/