// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class LoginScreenState{}
class LoginScreenInitialState extends LoginScreenState {
  
}
class LoginButtonState extends LoginScreenState {
   GlobalKey<FormState> formKey;
  late TextEditingController passwordController,emailController;
  LoginButtonState({
    required this.formKey,
    required this.passwordController,
    required this.emailController,
  });
}
