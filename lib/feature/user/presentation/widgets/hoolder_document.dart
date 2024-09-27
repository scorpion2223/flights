import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoolderDocument extends StatelessWidget{
  final double width;
  final double height;
  final VoidCallback onPressedTrue;
  final VoidCallback onPressedFalse;
  final bool status;


  const HoolderDocument({super.key, required this.width, required this.height, required this.onPressedTrue, required this.onPressedFalse, required this.status});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: width,
     height: height,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [Text("hoolder",style: TextStyle(color: AppColors.orange1),),
           Text("not hoolder",style: TextStyle(color: AppColors.orange1),)],),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
           IconButton(onPressed: onPressedTrue, icon: status?Icon(Icons.circle_rounded,color: AppColors.blue2,):Icon(Icons.circle_outlined,color: AppColors.blue2,)),
           IconButton(onPressed: onPressedFalse, icon: status?Icon(Icons.circle_outlined,color: AppColors.blue2,):Icon(Icons.circle_rounded,color: AppColors.blue2,)),

         ],),
       ],
     ),
   );
  }

}