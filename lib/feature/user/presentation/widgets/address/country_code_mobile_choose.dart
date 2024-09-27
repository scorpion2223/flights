

import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class CountryCodeMobileChoose extends StatefulWidget{
  final double height ;
  final bool status;
  final VoidCallback onPressed;
  final String name;

  const CountryCodeMobileChoose({
    super.key,
    required this.height,
    required this.status,
    required this.onPressed,
    required this.name});
  @override
  State<StatefulWidget> createState() {
    return _CountryCodeMobileChoose();
  }

}

class _CountryCodeMobileChoose extends State<CountryCodeMobileChoose>{
  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(vertical: widget.height),
        child:Container(
          width: 100,
          height: 50,

          decoration: BoxDecoration(


            color: Colors.white70,

          ),


          child: Center(child: TextButton(onPressed: widget.onPressed,child:Text(widget.name,
            style: TextStyle(color: AppColors.orange1,fontWeight: FontWeight.bold,fontSize: 20),))),
        ));
  }






}