import 'package:flutter/material.dart';


class CityPostalChoose extends StatefulWidget{
  final double height ;
  final bool status;
  final VoidCallback onPressed;
  final String name;
  final String postal;

  const CityPostalChoose({
    super.key,
    required this.height,
    required this.status,
    required this.onPressed,
    required this.name, required this.postal
  });
  @override
  State<StatefulWidget> createState() {
    return _CityPostalChoose();
  }

}

class _CityPostalChoose extends State<CityPostalChoose>{
  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(vertical: widget.height),
        child:Container(
          width: 150,

          decoration: BoxDecoration(


            color: Colors.white,

          ),


          child: Row(
            children: [
              Expanded(child:Center(child: Text("${widget.name}\n"
                  "${widget.postal}"))),
              IconButton(

                  onPressed: widget.onPressed,
                  icon: widget.status?Icon(Icons.arrow_upward_outlined):Icon(Icons.arrow_downward_outlined)),


            ],
          ),
        ));
  }






}