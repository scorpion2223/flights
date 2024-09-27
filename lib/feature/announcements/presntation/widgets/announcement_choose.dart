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
              Expanded(child:Center(child: Text(widget.name))),
              IconButton(

                  onPressed: widget.onPressed,
                  icon: widget.status?Icon(Icons.arrow_upward_outlined):Icon(Icons.arrow_downward_outlined)),


            ],
          ),
        ));
  }






}