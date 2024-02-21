// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';

abstract class SignUpScreenBlocState {
  
}
class SignUpScreenInitialState extends SignUpScreenBlocState{
}
class SignUpButtonState extends SignUpScreenBlocState {
  GlobalKey<FormState> formKey;
 late TextEditingController nameController,passwordController,emailController;
  SignUpButtonState({
    required this.formKey,
    required this.nameController,
    required this.passwordController,
    required this.emailController,
  });
}
