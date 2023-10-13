import 'package:bloc_counter/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget forgetPassword(BuildContext context, Function() onTap) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: onTap,
      child: Text(
        "Forget Password?",
        style: TextStyle(
            color: AppColors.primaryElement,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryElement,
            fontSize: 15.sp),
      ),
    ),
  );
}
