import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, {Color? color}){
  final snackBar = SnackBar(
      content: Text(message),
    backgroundColor: color ?? Colors.black87,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}