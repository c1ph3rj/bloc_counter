import 'package:bloc_counter/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar signInAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        height: 1.0,
      ),
    ),
    title: Text(
      "Log In",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryText, fontSize: 22.sp, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _thirdPartyLoginIcons(iconName: "google", onTap: () {}),
        _thirdPartyLoginIcons(iconName: "apple", onTap: () {}),
        _thirdPartyLoginIcons(iconName: "facebook", onTap: () {})
      ],
    ),
  );
}

Widget _thirdPartyLoginIcons(
    {required String iconName, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h, top: 20.h),
    child: Text(
      text,
      style: TextStyle(
          color: AppColors.primaryThreeElementText, fontWeight: FontWeight.normal, fontSize: 14.sp),
    ),
  );
}

Widget reusableTextField(String hintText, String textType, String iconName, void Function(String value) onChanged) {
  return Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.h,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: onChanged,
              keyboardType: TextInputType.emailAddress,
              obscureText: (textType == "password") ? true : false,
              style: TextStyle(color: AppColors.primaryText, fontSize: 15.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.primarySecondaryElementText, fontSize: 15),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          )
        ],
      ));
}


Widget logInButton(void Function() onPressed) {
  return SizedBox(
    width: 375.w,
    height: 50.h,
    child: MaterialButton(
      onPressed: onPressed,
      color: AppColors.primaryElement,
      disabledColor: Colors.grey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Text(
        "Log In",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget registerButton() {
  return SizedBox(
    width: 375.w,
    height: 50.h,
    child: MaterialButton(
      onPressed: () {},
      color: AppColors.primarySecondaryBackground,
      disabledColor: Colors.grey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Text(
        "Register",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

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
