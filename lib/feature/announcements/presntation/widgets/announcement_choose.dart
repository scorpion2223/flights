import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class AnnouncementChoose extends StatefulWidget{
  final double height ;
  final double width ;
  final bool status;
  final VoidCallback onPressed;
  final String name;

  const AnnouncementChoose({
    super.key,
    required this.height,
    required this.status,
    required this.onPressed,
    required this.name,
    required this.width,});
  @override
  State<StatefulWidget> createState() {
    return _AnnouncementChoose();
  }

}

class _AnnouncementChoose extends State<AnnouncementChoose>{
  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(vertical: widget.height),
        child:Container(
          width: widget.width,

          decoration: BoxDecoration(


            color: Colors.white,

          ),


          child: Row(
            children: [
              Expanded(child:Center(child: Text(widget.name,style: TextStyle(color: AppColors.blue2,fontWeight: FontWeight.bold,fontSize: 20),))),
              IconButton(

                  onPressed: widget.onPressed,
                  icon: widget.status?Icon(Icons.arrow_upward_outlined):Icon(Icons.arrow_downward_outlined)),


            ],
          ),
        ));
  }






}