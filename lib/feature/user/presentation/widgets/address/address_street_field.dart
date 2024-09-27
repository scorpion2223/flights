import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressStreetField extends StatefulWidget{
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String? currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  AddressStreetField({
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
    return _AddressStreetField();
  }

}


class _AddressStreetField extends State<AddressStreetField>{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.hintText,
      ),
      keyboardType: TextInputType.text,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode,
      initialValue: widget.currentValue,
      validator: widget.validator,
      onChanged: widget.onChanged,

    );
  }

}