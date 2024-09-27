

import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/core/params/payment_param.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/payment/presentation/widgets/amount_form_field.dart';
import 'package:flightes/feature/payment/presentation/widgets/currency_name_form.dart';
import 'package:flightes/feature/user/presentation/widgets/document_date.dart';
import 'package:flightes/feature/user/presentation/widgets/document_name_field.dart';
import 'package:flightes/feature/user/presentation/widgets/document_number_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget{
  final GlobalKey<FormState> formState;
  final PaymentParam param;
  final ValueChanged<PaymentParam> onChanged;
  final double width ;
  final double height;

  const PaymentForm({super.key, required this.formState, required this.param, required this.onChanged, required this.width, required this.height});
  @override
  State<StatefulWidget> createState() {
    return _PaymentForm();
  }

}

class _PaymentForm extends State<PaymentForm>{
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
                SizedBox(width: widget.width/3,child: AmountFormField(
                  currentValue: widget.param.amount,

                  onChanged: (value)=>widget.onChanged(widget.param.copyWith(amount: value)),
                  validator: widget.param.emptyValidator,
                  hintText: 'amount',),),
                CurrencyNameForm(height: widget.height, listWidth: widget.width, listHeight: widget.height, onDocumentChanged: (value){
                  widget.param.currency = value;
                  setState(() {

                  });
                })



              ],),
            SizedBox(height: 10,),






          ],));
  }

}
