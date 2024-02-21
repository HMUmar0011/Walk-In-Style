// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

abstract class SignUpScreenBlocEvent {
  
}
class SignUpButtonEvent extends SignUpScreenBlocEvent {
  BuildContext context;
  SignUpButtonEvent(this.context);
}
class GoogleSignInEvent extends SignUpScreenBlocEvent {
   BuildContext context;
  GoogleSignInEvent({
    required this.context,
  });
  
}
