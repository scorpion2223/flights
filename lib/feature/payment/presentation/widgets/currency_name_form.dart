



import 'package:flightes/core/params/payment_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constatnts/currency.dart';
import 'currency_name_choose.dart';

class CurrencyNameForm extends StatefulWidget {

  final double height;
  final double listWidth;
  final double listHeight;
  final ValueChanged<String> onDocumentChanged;

  const CurrencyNameForm(
      {super.key,
        required this.height,
        required this.listWidth,
        required this.listHeight,
        required this.onDocumentChanged,
       });

  @override
  State<StatefulWidget> createState() {
    return _CurrencyNameForm();
  }
}

class _CurrencyNameForm extends State<CurrencyNameForm> {
  String name = currencies.first;
  @override
  Widget build(BuildContext context) {
    return CurrencyNameChoose(
      height: widget.height/40,
      status: false,
      onPressed: () {
        _showListDialog(context, alertDialogTitle: "countries", items: currencies);
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
                child: Text("${index} : ${items[index]}"),
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
