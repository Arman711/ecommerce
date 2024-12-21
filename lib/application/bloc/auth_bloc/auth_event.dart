import 'package:flutter/material.dart';

@immutable
class AuthEvent {}

final class SignUpWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  SignUpWithEmailAndPassword(this.email, this.password);
}

final class Login extends AuthEvent {
  final String email;
  final String password;
  Login(this.email, this.password);
}
