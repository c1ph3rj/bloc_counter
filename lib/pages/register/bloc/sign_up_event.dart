import 'package:flutter/material.dart';

@immutable
abstract class SignUpEvent {}

class EmailEvent extends SignUpEvent{
  final String email;
  EmailEvent({required this.email});
}

class PasswordEvent extends SignUpEvent {
  final String password;
  PasswordEvent({required this.password});
}

class ConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;
  ConfirmPasswordEvent({required this.confirmPassword});
}

class UserNameEvent extends SignUpEvent {
  final String userName;
  UserNameEvent({required this.userName});
}