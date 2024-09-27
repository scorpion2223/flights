import 'package:flightes/core/params/user_param.dart';
import 'package:flightes/feature/auth/presentation/widgets/EmailFormField.dart';
import 'package:flightes/feature/auth/presentation/widgets/PasswordFormField.dart';
import 'package:flutter/cupertino.dart';

class LoginForm extends StatefulWidget{
  final GlobalKey<FormState> formState;
  final UserParam param;
  final ValueChanged onChanged;

  const LoginForm({super.key, required this.formState, required this.param, required this.onChanged});
  @override
  State<StatefulWidget> createState() {
 return  _LoginForm();
  }

}

class _LoginForm extends State<LoginForm>{
  @override
  Widget build(BuildContext context) {
   return Form(
       key: widget.formState,

       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
     children: [

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


     ],
   ));
  }

}