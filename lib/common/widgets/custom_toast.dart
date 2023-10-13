import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
Color backgroundColor = Colors.black,
Color textColor = Colors.white
}) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: backgroundColor, textColor: textColor, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.SNACKBAR, fontSize: 16.sp);
}

somethingWentWrong (){
  return toastInfo(msg: "Something went Wrong!");
}