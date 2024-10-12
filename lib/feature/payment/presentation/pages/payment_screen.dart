import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flightes/feature/payment/data/data_sources/remote/payment_remote_data_source.dart';
import 'package:flightes/feature/payment/data/repositories/payment_repository_impl.dart';
import 'package:flightes/feature/payment/domain/usecases/start_payment_use_case.dart';
import 'package:flightes/feature/payment/presentation/manager/cubits/start_payment/start_payment_cubit.dart';
import 'package:flightes/feature/payment/presentation/widgets/payment_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constatnts/app_colors.dart';
import '../../../../core/utils/scaffold_message_util.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentScreen();
  }
}

class _PaymentScreen extends State<PaymentScreen> {
  final formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) {
            return StartPaymentCubit(
              useCase: StartPaymentUseCase(
                  repository: PaymentRepositoryImpl(
                      remoteDataSource:
                          PaymentRemoteDataSourceWithDio(dio: Dio()))),
            );
          },
          child: BlocConsumer<StartPaymentCubit,StartPaymentState>(
            listener: (context,state){
if(state is StartPaymentSuccess){
  ScaffoldMessageUtil().customScaffoldMessenger(context, "payment success", Colors.green);

}
if(state is StartPaymentFailed){
  ScaffoldMessageUtil().customScaffoldMessenger(context, "payment failed", Colors.red);

}
            },
            builder: (context,state){
              return Column(

                children: [
                  SizedBox(height: height/10,),
                  Container(
                    width: width,
                    height: height/5,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/stripe.png"))),
                  ),
                  SizedBox(height: height/10,),

                  PaymentForm(
                      formState: formState,
                      param: context.read<StartPaymentCubit>().param,
                      onChanged: (value){
                        context.read<StartPaymentCubit>().param = value;
                        setState(() {
                          log("amount : ${context.read<StartPaymentCubit>().param.amount}\n"
                              "currency : ${context.read<StartPaymentCubit>().param.currency}\n");
                        });
                      },
                      width: width,
                      height: height),
                  SizedBox(height: height/10,),
                  TextButton(onPressed: (){
                    bool isValid = formState.currentState!.validate();
                    if(isValid){
                      context.read<StartPaymentCubit>().storeBooking();
                    }
                  }, child: (state is StartPaymentLoading)?CircularProgressIndicator():Text("Pay",style: TextStyle(color: AppColors.orange1,fontSize: 30,shadows: [
                    BoxShadow(
                      blurRadius: 3
                    )
                  ]),)),



                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
