import 'package:bloc_counter/common/widgets/custom_toast.dart';
import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInController {
  final BuildContext context;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context
            .read<SignInBloc>()
            .state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          toastInfo(msg: "Please enter your email to continue!");
        } else if (password.isEmpty) {
          toastInfo(msg: "Please enter your password to continue!");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          ActionCodeSettings actionCodeSettings = ActionCodeSettings(
            url: 'https://www.example.com/finishSignUp?cartId=1234',
            handleCodeInApp: true,
            iOSBundleId: 'com.example.ios',
            androidPackageName: 'com.c1ph3rj.bloc_counter.bloc_counter ',
            androidMinimumVersion: '12',
          );
          if (credential.user == null) {
            toastInfo(msg: "User does not exist! please register to continue.");
          } else if (!credential.user!.emailVerified) {
            toastInfo(msg: "Please verify your register email id to continue!");
          } else {
            var user = credential.user;
            if (user != null) {
              if(navigatorKey.currentState == null){
                somethingWentWrong();
              }else {
                navigatorKey.currentState?.pushNamed("homeScreen");
              }
            } else {
              somethingWentWrong();
            }
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "User not found! please register to continue.");
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Incorrect password!");
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Please enter a valid email id to continue!");
          }
        }
      }
    } catch (e) {

    }
  }
}
