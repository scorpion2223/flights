import 'dart:developer';

import 'package:flightes/core/params/search_param.dart';
import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/flights/presentation/pages/flights_offer_screen_test.dart';
import 'package:flightes/feature/flights/presentation/widgets/iata_codes_double.dart';
import 'package:flightes/feature/flights/presentation/widgets/numbers_form.dart';
import 'package:flutter/material.dart';

class InsertOffersInformationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InsertOffersInformationScreen();
  }
}

class _InsertOffersInformationScreen
    extends State<InsertOffersInformationScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SearchParam param = SearchParam.newParam();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Find Flight Offers "),),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
          child:  Column(
            children: [
              SearchForm(
                  formState: formState,
                  param: param,
                  onChanged: (value) {
                    param = value;
                    setState(() {});
                  }),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [ Text("Origin Location Code",style: TextStyle(color: Colors.green),),
//                 IataCodesForm(
//                     height: height,
//                     listWidth: width,
//                     listHeight: height,
//                     onIataCodesChanged: (value) {
//                       param.originLocationCode= value.code;
//
//                       setState(() {
// log( param.originLocationCode.toString());
//                       });
//                     },
//                     param: param),],),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text("Destination Location Code",style: TextStyle(color: Colors.green),),
//
//                   IataCodesForm(
//                       height: height,
//                       listWidth: width,
//                       listHeight: height,
//                       onIataCodesChanged: (value) {
//                         param.destinationLocationCode =value.code;
//                         setState(() {
//
//                         });
//                       },
//                       param: param),
//                 ],),

            IataCodesDouble(height: height, listWidth: width, listHeight: height, onIataCodesChanged:  (value) {
                        param.originLocationCode =value.code;
                        setState(() {

                        });

                        log(param.originLocationCode.toString());
                      }, param: param, onIataCodesChanged2:  (value) {
                        param.destinationLocationCode =value.code;
                        setState(() {

                        });
                        log(param.destinationLocationCode.toString());
                      },),

              IconButton(
                onPressed: () {
                  var isValid = formState.currentState!.validate();
                  if (isValid) {
                    log("${param.destinationLocationCode}\n"
                        "${param.originLocationCode}\n"
                        "${ param.returnDate}\n"
                        "${param.max}\n"
                        "${param.adults}\n"
                        "${ param.departureDate}\n");
                    if (param.codeValidator()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "destinationCode is same originCode!"),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FlightsOfferScreenTest(param: param)));
                    }
                  }
                },
                icon: const Icon(Icons.filter_alt_outlined,size: 70,color: AppColors.blue2,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
