import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/feature/flights/presentation/widgets/fields/date_form_field.dart';
import 'package:flightes/feature/flights/presentation/widgets/fields/numbers_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constatnts/app_colors.dart';

class SearchForm extends StatefulWidget{
  final GlobalKey<FormState> formState;
  final SearchParam param;
  final ValueChanged<SearchParam> onChanged;

  const SearchForm({super.key, required this.formState, required this.param, required this.onChanged});
  @override
  State<StatefulWidget> createState() {
   return _SearchForm();
  }

}

class _SearchForm extends State<SearchForm>{
  @override
  Widget build(BuildContext context) {
   return Form(
       key: widget.formState,
       child: Column(children: [

     NumbersFormField(
       validator: widget.param.emptyValidator,
         onChanged: (value)=>widget.onChanged(widget.param.copyWith(max: value)),
         currentValue: widget.param.max,
         hintText: "max travelers"),
     NumbersFormField(
         validator: widget.param.emptyValidator,
         onChanged: (value)=>widget.onChanged(widget.param.copyWith(adults: value)),
         currentValue: widget.param.adults,
         hintText: "number of travelers"),
     SizedBox(height: 10,),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Text("Departure Date",style: TextStyle(color: AppColors.orange2),),
         DateFormFiled(
             currentValue: widget.param.departureDate,
             label: "",
             onChanged: (value)=>widget.onChanged(widget.param.copyWith(departureDate: value)),
             validator: (value)
             {
               return null;
             })
         ,
       ],),


         SizedBox(height: 10,),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Return Date",style: TextStyle(color:AppColors.orange2),),
             DateFormFiled(
                 currentValue: widget.param.returnDate,
                 label: "",
                 onChanged: (value)=>widget.onChanged(widget.param.copyWith(returnDate: value)),
                 validator: (value)
                 {
                   return null;
                 })
           ],),


   ],));
  }

}