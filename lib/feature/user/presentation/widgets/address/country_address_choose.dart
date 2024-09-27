import 'package:flutter/material.dart';


class CountryAddressChoose extends StatefulWidget{
  final double height ;
  final bool status;
  final VoidCallback onPressed;
  final String name;

  const CountryAddressChoose({
    super.key,
    required this.height,
    required this.status,
    required this.onPressed,
    required this.name});
  @override
  State<StatefulWidget> createState() {
    return _CountryAddressChoose();
  }

}

class _CountryAddressChoose extends State<CountryAddressChoose>{
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
              Expanded(child:Center(child: Text(widget.name))),
              IconButton(

                  onPressed: widget.onPressed,
                  icon: widget.status?Icon(Icons.arrow_upward_outlined):Icon(Icons.arrow_downward_outlined)),


            ],
          ),
        ));
  }






}