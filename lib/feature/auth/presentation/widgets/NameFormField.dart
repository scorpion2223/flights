import 'package:flutter/material.dart';

class NameFormField extends StatefulWidget{

  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hintText;
  final String ? currentValue;
  final FocusNode ? nextFocusNode;
  final FocusNode ? focusNode;

  NameFormField({
    required this.validator,
    required this.onChanged,
    required this.currentValue,
    required this.hintText,

    this.nextFocusNode,
    this.focusNode,



  });
  @override
  State<StatefulWidget> createState() {
    return _NameFormField();
  }






}

class _NameFormField extends State<NameFormField>{
  @override
  Widget build(BuildContext context) {
   return TextFormField(
     maxLength: 10,


     keyboardType: TextInputType.name,
     focusNode: widget.focusNode,
     onFieldSubmitted: (_)=>widget.nextFocusNode,

     initialValue: widget.currentValue,
     validator: widget.validator,
     onChanged: widget.onChanged,
     decoration: InputDecoration(


         hintText: widget.hintText,


     ),





   );
  }







}