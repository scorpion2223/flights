import 'package:flightes/feature/air_porst/domain/entities/air_ports_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constatnts/app_colors.dart';
class AirPortComponent extends StatelessWidget{
  final Datum airPort;
  final double width;
  final double height;

  const AirPortComponent({super.key, required this.airPort, required this.width, required this.height});
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

            children: [

              Container(
                width: width/2,
                height: height,

                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/airport.png"),
                      fit: BoxFit.contain
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: width/10),
                height: height,
                width: width/2.2,
                alignment: Alignment.center,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text(airPort.name!,style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold),),
                  Text("${airPort.address!.countryName.toString()}\n${airPort.address!.cityName.toString()}"),
                  // Text(airPort.address!.cityName.toString()),

                ],),
              ),

            ],));


  }

}

