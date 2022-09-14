import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMassege({
  String? text,
  ToastStates? state,
}) =>
    Fluttertoast.showToast(
      msg: text ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(
        state!,
      ),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// eunm
enum ToastStates { SUCCESS, ERROR, WARNING }
Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
