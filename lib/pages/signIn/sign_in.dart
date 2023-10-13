import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:bloc_counter/pages/signIn/sign_in_controller.dart';
import 'package:bloc_counter/pages/signIn/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../../common/widgets/common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(titleString: "Log In"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildThirdPartyLogin(context),
            reusableText("Or use your email account to login"),
            Container(
              margin: EdgeInsets.only(top: 40.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Email"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField("Enter you email address", "email", "user",
                      (value) {
                    context.read<SignInBloc>().add(EmailEvent(value));
                  }),
                  reusableText("Password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField("Enter you password", "password", "lock",
                      (value) {
                    context.read<SignInBloc>().add(PasswordEvent(value));
                  }),
                  forgetPassword(context, () => null),
                  SizedBox(
                    height: 50.h,
                  ),
                  reusableButton(
                      titleString: "Log In",
                      onPressed: () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  reusableButton(
                    titleString: "Sign up",
                      onPressed: () {
                        Navigator.of(context).pushNamed("register");
                      },
                      buttonColor: AppColors.primarySecondaryBackground,
                      textColor: AppColors.primaryText)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
