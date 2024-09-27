import 'package:flutter/cupertino.dart';

class TravelerForm extends StatefulWidget{
  final GlobalKey<FormState> formState;

  const TravelerForm({super.key, required this.formState});
  @override
  State<StatefulWidget> createState() {
  return _TravelerForm();
  }

}

class _TravelerForm extends State<TravelerForm>{
  @override
  Widget build(BuildContext context) {
   return Form(
       key: widget.formState,
       child: Column(children: [],));
  }

}