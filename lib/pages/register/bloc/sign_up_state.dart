import 'package:flutter/material.dart';

class SignUpState {
  String userName;
  String email;
  String password;
  String confirmPassword;

  SignUpState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.confirmPassword = ""});

  SignUpState copyWith(
      {String? userName,
      String? email,
      String? password,
      String? confirmPassword}) {
    return SignUpState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}
