
import 'package:dio/dio.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/core/utils/constatnts/countries_cities_postals.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/presentation/widgets/address/city_postal_choose.dart';
import 'package:flightes/feature/user/presentation/widgets/country_name_choose.dart';
import 'package:flightes/feature/user/presentation/widgets/document_type_choose.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constatnts/app_colors.dart';
import 'country_address_choose.dart';


class CountryAddressForm extends StatefulWidget {

  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<Country> onDocumentChanged;
  final ValueChanged<City> onChangedCity;

  const CountryAddressForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onDocumentChanged,

      required this.onChangedCity});

  @override
  State<StatefulWidget> createState() {
    return _CountryAddressForm();
  }
}

class _CountryAddressForm extends State<CountryAddressForm> {
  String name = countries.first.name;
  String cityName = countries.first.cities.first.name;
  String code = countries.first.cities.first.postalCode;
  List<City> cities = countries.first.cities;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Country ",
              style: TextStyle(color: AppColors.orange1),
            ),
            CountryAddressChoose(
              height: widget.height/40,
              status: false,
              onPressed: () {
                _showListDialog(context, alertDialogTitle: "countries", items: countries);
              }, name: name,
            ),
          ],
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "City\nPostal Code ",
              style: TextStyle(color: AppColors.orange1),
            ),
            CityPostalChoose(
                height: widget.height/40,
                status: false,
                onPressed: (){
                  _showListDialogCity(context, alertDialogTitle: "cites\n"
                      "codes", items: cities);
                },
                name: cityName,
                postal: code)
          ],
        ),

      ],
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<Country> items,

      }) {
    final alert = AlertDialog(
        title: Center(child: Text(alertDialogTitle)),
        alignment: Alignment.center,
        content: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            width: widget.listWidth / 4,
            height: widget.listHeight * 0.5,
            child: ListView.builder(
              itemBuilder: (context, index) => TextButton(
                onPressed: () async {
                  name = items[index].name;
                  cities = items[index].cities;
                  cityName=items[index].cities.first.name;
                  code=items[index].cities.first.postalCode;

                  widget.onDocumentChanged(items[index]);
                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text("${index} : ${items[index].name}"),
              ),
              itemCount: items.length,
            )));

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void _showListDialogCity(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<City> items,

      }) {
    final alert = AlertDialog(
        title: Center(child: Text(alertDialogTitle)),
        alignment: Alignment.center,
        content: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            width: widget.listWidth / 4,
            height: widget.listHeight * 0.5,
            child: ListView.builder(
              itemBuilder: (context, index) => TextButton(
                onPressed: () async {

                  cityName=items[index].name;
                  code=items[index].postalCode;

                  widget.onChangedCity(items[index]);
                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text("${items[index].name}\n"
                    "${items[index].postalCode}"),
              ),
              itemCount: items.length,
            )));

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
