import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          return;
        } else if (password.isEmpty) {
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {

          } else if (credential.user!.emailVerified) {

          } else {
            var user = credential.user;
            if (user != null) {
            } else {
            }
          }
        } on FirebaseAuthException catch (e){
          if(e.code == "user-not-found"){
            print("No User found for the email");
          } else if (e.code == "wrong-password" ){
            print("Wrong password provided by the user");
          } else if (e.code == "invalid-email"){
            print("Invalid email format : $email");
          }
    }
      }
    } catch (e) {}
  }
}
