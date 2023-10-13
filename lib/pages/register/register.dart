import 'package:bloc_counter/pages/register/bloc/sign_up_bloc.dart';
import 'package:bloc_counter/pages/register/bloc/sign_up_event.dart';
import 'package:bloc_counter/pages/register/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/common_widgets.dart';
import '../signIn/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignUpBloc>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(titleString: "Register"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            reusableText("Enter your details below & free sign up"),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Username"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField(
                      "Enter your user name", "email", "user", (userName) {
                        bloc.add(UserNameEvent(userName: userName));
                  }),
                  reusableText("Email"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField(
                      "Enter your email address", "email", "user", (email) {
                        bloc.add(EmailEvent(email: email));
                  }),
                  reusableText("Password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField(
                      "Enter your password", "password", "lock", (password) {
                        bloc.add(PasswordEvent(password: password));
                  }),
                  reusableText("Confirm Password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  reusableTextField(
                      "Re-enter your password to confirm", "password", "lock", (confirmPassword) {
                        bloc.add(ConfirmPasswordEvent(confirmPassword: confirmPassword));
                  }),
                  reusableText("By creating an account you have to agree with our terms and conditions."),
                  SizedBox(
                    height: 20.h,
                  ),
                  reusableButton(
                    titleString: "Sign Up",
                    onPressed: () {
                      SignUpController(context: context).handleSignUp();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
