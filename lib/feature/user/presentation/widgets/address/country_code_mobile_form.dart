

import 'package:dio/dio.dart';
import 'package:flightes/core/params/document_param.dart';
import 'package:flightes/feature/user/domain/entities/documents_type_entity.dart';
import 'package:flightes/feature/user/presentation/widgets/address/country_code_mobile_choose.dart';
import 'package:flightes/feature/user/presentation/widgets/country_name_choose.dart';
import 'package:flightes/feature/user/presentation/widgets/document_type_choose.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constatnts/country_mobile_phone_code.dart';


class CountryCodeMobileForm extends StatefulWidget {

  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<String> onDocumentChanged;

  const CountryCodeMobileForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onDocumentChanged,
      });

  @override
  State<StatefulWidget> createState() {
    return _CountryCodeMobileForm();
  }
}

class _CountryCodeMobileForm extends State<CountryCodeMobileForm> {
  String name = mobileCountryCodes.first;
  @override
  Widget build(BuildContext context) {
    return CountryCodeMobileChoose(
      height: widget.height/40,
      status: false,
      onPressed: () {
        _showListDialog(context, alertDialogTitle: "codes", items: mobileCountryCodes);
      }, name: name,
    );
  }

  void _showListDialog(
      BuildContext ctx, {
        required String alertDialogTitle,
        required List<String> items,

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
                  name = items[index];

                  widget.onDocumentChanged(items[index]);
                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text("${items[index]}"),
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
