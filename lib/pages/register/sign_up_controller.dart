import 'package:bloc_counter/common/methods.dart';
import 'package:bloc_counter/common/widgets/custom_toast.dart';
import 'package:bloc_counter/pages/register/bloc/sign_up_bloc.dart';
import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

class SignUpController {
  BuildContext context;

  SignUpController({required this.context});

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    final userName = state.userName;
    final emailId = state.email;
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    if(userName.isEmpty){
      toastInfo(msg: "Please enter username to continue!");
      return;
    }

    if(emailId.isEmpty){
      toastInfo(msg: "Please enter your email to continue!");
      return;
    }

    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if(!emailRegex.hasMatch(emailId)){
      toastInfo(msg: "Please enter a valid email to continue!");
      return;
    }

    if(password.isEmpty){
      toastInfo(msg: "Please enter password to continue!");
      return;
    }

    if(password != confirmPassword){
      toastInfo(msg: "Password does not match please verify!");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailId, password: password);
      if (credential.user == null) {
        toastInfo(msg: "User does not exist! please register to continue.");
      } else if (credential.user!.emailVerified) {
        toastInfo(msg: "Please verify your register email id to continue!");
      } else {
        var user = credential.user;
        if (user != null) {

        } else {
          somethingWentWrong();
        }
      }
    } catch (e){
      error(e);
    }
  }
}
