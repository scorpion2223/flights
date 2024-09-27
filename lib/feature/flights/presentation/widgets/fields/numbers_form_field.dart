import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumbersFormField extends StatefulWidget{
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String? currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  NumbersFormField({
    this.validator,
    required this.onChanged,
    required this.currentValue,
    required this.hintText,
    this.nextFocusNode,
    this.focusNode,
    this.controller,
  });
  @override
  State<StatefulWidget> createState() {
   return _NumbersFormField();
  }

}


class _NumbersFormField extends State<NumbersFormField>{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.hintText,
      ),
      textAlign: TextAlign.end,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode,
      initialValue: widget.currentValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

}