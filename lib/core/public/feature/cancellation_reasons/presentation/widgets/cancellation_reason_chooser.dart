import 'package:flutter/material.dart';


class CancellationReasonChooser extends StatefulWidget{
  final double height ;
  final bool status;
  final VoidCallback onPressed;
  final String name;

  const CancellationReasonChooser({
    super.key,
    required this.height,
    required this.status,
    required this.onPressed,
    required this.name});
  @override
  State<StatefulWidget> createState() {
    return _CancellationReasonChooser();
  }

}

class _CancellationReasonChooser extends State<CancellationReasonChooser>{
  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(vertical: widget.height),
        child:Container(

          decoration: const BoxDecoration(


            color: Colors.white,

          ),


          child: Row(
            children: [
              Expanded(child:Center(child: Text(widget.name))),
              IconButton(

                  onPressed: widget.onPressed,
                  icon: const Icon(Icons.arrow_downward_outlined)),


            ],
          ),
        ));
  }






}