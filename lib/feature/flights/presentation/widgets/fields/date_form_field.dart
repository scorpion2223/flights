
// ignore_for_file: use_key_in_widget_constructors

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';


class DateFormFiled extends StatefulWidget{

  final ValueChanged<DateTime> onChanged;
  final DateTime? currentValue ;

  final String label;

  final FormFieldValidator<DateTime> ?validator;


  const DateFormFiled({


    required this.currentValue,
    required this.label,

    required this.onChanged,
    required this.validator,


  });

  String get _label

  {
    if(currentValue == null) return label;


    return formatDate(currentValue!, [yyyy, '-', mm, '-', dd]);
  }
  @override
  State<StatefulWidget> createState() {
    return _DateFormFiled();
  }






}

class _DateFormFiled extends State<DateFormFiled>{
//ignore
  static const _100_YEARS = Duration(days: 365*100);
  static const _18_YEARS = Duration(days: 365*18);

  @override

  Widget build(BuildContext context) {
    return FormField<DateTime>(

      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.currentValue,
      validator: widget.validator,
      builder: (formState)
      {


        late   InputBorder shape ;
        if(formState.hasError){
          if(Theme.of(context).inputDecorationTheme.errorBorder != null){
            shape= Theme.of(context).inputDecorationTheme.errorBorder!;
          }
        }else{
          if(Theme.of(context).inputDecorationTheme.enabledBorder!=null){
            shape = Theme.of(context).inputDecorationTheme.enabledBorder!;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 200,
                decoration: const BoxDecoration(

                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(30),
                  //
                  // ),


                  color: Colors.white,
                ),

                child:
                Stack(children: [

                  _buildDateSelectListTile(context,formState,widget._label),
                  if(widget.currentValue != null) _buildFloatingLabel(context),
                ],)),
            if(formState.hasError) _buildErrorText(formState,context),
          ],
        );
      },




    );


  }

  Widget _buildErrorText(
      FormFieldState<DateTime> formState,BuildContext context
      ){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:8.0 ),
      child: Text(

        formState.errorText!,
        style: const TextStyle(color: Colors.red),

      ),);
  }

  Widget  _buildDateSelectListTile(
      //InputBorder shape,
      BuildContext context,
      FormFieldState<DateTime> formState,
      String title
      ){
    return  Padding(
      padding:const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        //  shape: shape!=null?shape : Theme(da,
        trailing: const Icon(
          Icons.date_range,
          color:Colors.blue,
        ),


        title: Text(title),


        onTap:()async {
          final date = await  showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime.utc(2100),
          );
          if(date != null){
            widget.onChanged(date);
            formState.didChange(date);

          }

        },

      ),);


  }

  Widget _buildFloatingLabel(BuildContext context){
    return Positioned(
        right: 12.0,
        top: -2.0,
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 6.0),
          color: Colors.transparent,
          child: Text(
            widget.label,
            style: Theme.of(context).inputDecorationTheme.helperStyle,
          ),
        ));

  }


}





