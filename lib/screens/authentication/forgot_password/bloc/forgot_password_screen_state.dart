// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

abstract class ForgotPasswordScreenState {
  
}
class ForgotPasswordScreenInitialState extends ForgotPasswordScreenState {
  
}
class ForgotPasswordButtonState extends ForgotPasswordScreenState {
  GlobalKey<FormState> formKey;
  TextEditingController emailController;
  ForgotPasswordButtonState({
    required this.formKey,
    required this.emailController,
  });
}
