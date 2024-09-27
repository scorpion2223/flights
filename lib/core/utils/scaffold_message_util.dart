import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldMessageUtil{
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customScaffoldMessenger(BuildContext context,String text, Color color){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),backgroundColor:color ,));
  }
}
