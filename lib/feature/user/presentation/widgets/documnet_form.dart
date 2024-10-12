

import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/user/presentation/widgets/document_date.dart';
import 'package:flightes/feature/user/presentation/widgets/document_name_field.dart';
import 'package:flightes/feature/user/presentation/widgets/document_number_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentForm extends StatefulWidget{
  final GlobalKey<FormState> formState;
  final DocumentParam param;
  final ValueChanged<DocumentParam> onChanged;
  final double width ;
  final double height;

  const DocumentForm({super.key, required this.formState, required this.param, required this.onChanged, required this.width, required this.height});
  @override
  State<StatefulWidget> createState() {
    return _DocumentForm();
  }

}

class _DocumentForm extends State<DocumentForm>{
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formState,
        child: Column(

          children: [


          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text("Storage Date",style: TextStyle(color: AppColors.orange1),),
              DocumentDate(
                  currentValue: widget.param.storageDate,
                  label: "",
                  onChanged: (value)=>widget.onChanged(widget.param.copyWith(storageDate: value)),
                  validator: null),


            ],),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text("Expired Date",style: TextStyle(color: AppColors.orange1),),
              DocumentDate(
                  currentValue: widget.param.expireDate,
                  label: "",
                  onChanged: (value)=>widget.onChanged(widget.param.copyWith(expireDate: value)),
                  validator: null),


            ],),
            SizedBox(height: 10,),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Issuance Information",style: TextStyle(color: AppColors.blue2,fontWeight: FontWeight.bold,fontSize: 20),),
               SizedBox(width: widget.width/2,),


              ],),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            SizedBox(
                width: widget.width/1.2,
                child:  DocumentNameField(
                  currentValue: widget.param.issuanceLocation,

                  onChanged: (value)=>widget.onChanged(widget.param.copyWith(issuanceLocation: value)),
                  validator: widget.param.emptyValidator,
                  hintText: 'Issuance Location',)),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Issuance Date",style: TextStyle(color: AppColors.orange1),),
                DocumentDate(
                    currentValue: widget.param.issuanceDate,
                    label: "",
                    onChanged: (value)=>widget.onChanged(widget.param.copyWith(issuanceDate: value)),
                    validator: null),


              ],),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Expiry Date",style: TextStyle(color: AppColors.orange1),),
                DocumentDate(
                    currentValue: widget.param.expiryDate,
                    label: "",
                    onChanged: (value)=>widget.onChanged(widget.param.copyWith(expiryDate: value)),
                    validator: null),


              ],),


            SizedBox(height: 10,),





        ],));
  }

}
