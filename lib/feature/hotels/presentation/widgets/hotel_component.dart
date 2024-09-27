import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/hotels/domain/entities/hotels_entity.dart';
import 'package:flutter/material.dart';
class HotelComponent extends StatelessWidget{
  final Datum hotel;
  final double width;
  final double height;

  const HotelComponent({super.key, required this.hotel, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       border: Border.all(color: AppColors.orange1,style: BorderStyle.solid,width: (width/4)*(0.02)),
       borderRadius: BorderRadius.circular(10),

     ),
     width: width,
     height: height,
    child:Row(

      children: [
      Container(
        width: width/2.5,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/hotel.png")),
        ),
      ),

   Expanded(child:
   Container(
     height: height,
       alignment: Alignment.center,

       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,

         children: [
         Text(hotel.name!,
           style: TextStyle(
           fontSize: 10,
             fontWeight: FontWeight.bold,
             color: AppColors.orange1
         ),),

         Text("hotel ID: ${hotel.hotelId}"),


       ],),
     )),
   ],));
  }

}