import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String hintText;
  final String? currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;

  PasswordFormField({
    required this.validator,
    required this.onChanged,
    required this.currentValue,
    required this.hintText,
    this.nextFocusNode,
    this.focusNode,
  });

  @override
  State<StatefulWidget> createState() {
    return _PasswordFormField();
  }
}

class _PasswordFormField extends State<PasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.nextFocusNode,
      obscureText: _obscurePassword,
      initialValue: widget.currentValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: "",
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.blue2,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: AppColors.blue2,
          ),
        ),
      ),
    );
  }
}
