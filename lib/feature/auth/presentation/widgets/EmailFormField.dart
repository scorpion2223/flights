import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/material.dart';
class EmailFormField extends StatefulWidget{

  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hintText;
  final String ? currentValue;
  final FocusNode ? nextFocusNode;
  final FocusNode ? focusNode;

  EmailFormField({
    required this.validator,
    required this.onChanged,
    required this.currentValue,
    required this.hintText,

    this.nextFocusNode,
    this.focusNode,



  });

  @override
  State<StatefulWidget> createState() {
    return _EmailFormField();
  }

}

class _EmailFormField extends State<EmailFormField>{

  @override
  Widget build(BuildContext context) {
    return TextFormField(


      keyboardType: TextInputType.text,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_)=>widget.nextFocusNode,


      initialValue: widget.currentValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(

          hintText: widget.hintText,
          helperText: "",
          suffixIcon: IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.email,
              color:AppColors.blue2,
            ),

          )
      ),



    );
  }

}