import 'package:flightes/feature/auth/presentation/widgets/NameFormField.dart';
import 'package:flightes/feature/auth/presentation/widgets/PhoneFormField.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/params/user_param.dart';
import 'EmailFormField.dart';
import 'PasswordFormField.dart';

class RegisterForm extends StatefulWidget{
  final GlobalKey<FormState> formState;
  final UserParam param;
  final ValueChanged onChanged;

  const RegisterForm({super.key, required this.formState,required this.param, required this.onChanged});
  @override
  State<StatefulWidget> createState() {
    return _RegisetrForm();
  }

}
class _RegisetrForm extends State<RegisterForm>{
  @override
  Widget build(BuildContext context) {
   return Form(
       key: widget.formState,
       child: Column(
     children: [
       NameFormField(
           validator: widget.param.nameValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(userName: value)),
           currentValue: widget.param.userName,
           hintText: "user name"),
       NameFormField(
           validator: widget.param.nameValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(firstName: value)),
           currentValue: widget.param.firstName,
           hintText: "first name"),
       NameFormField(
           validator: widget.param.nameValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(lastName: value)),
           currentValue: widget.param.lastName,
           hintText: "last name"),
       EmailFormField(
           validator: widget.param.emailValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(email: value)),
           currentValue: widget.param.email,
           hintText: "email"),
       PasswordFormField(
           validator: widget.param.passwordValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(password: value)),
           currentValue: widget.param.password,
           hintText: "password"),
       PasswordFormField(
           validator: widget.param.passwordValidator,
           onChanged: (value)=>widget.onChanged(widget.param.copyWith(confirmPassword: value)),
           currentValue: widget.param.confirmPassword,
           hintText: "confirm password"),
       PhoneFormField(

           onChanged: (value)=>widget.onChanged(widget.param.copyWith(phone: value)),
           currentValue: widget.param.phone,
           hintText: "phone number"),
     ],
   ));
  }

}