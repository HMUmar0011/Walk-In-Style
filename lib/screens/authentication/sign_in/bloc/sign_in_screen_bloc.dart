import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/components/sign_in_with_google.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc_event.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc_state.dart';
import 'package:walkinstyleapp/services/firebase_services.dart';
import 'package:walkinstyleapp/widgets/custom_toast.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent,LoginScreenState>{
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  LoginScreenBloc():super(LoginScreenInitialState()){
    _loaded;
    on<LoginButtonEvent>((event, emit) {
    if (_formKey.currentState!.validate()) {
      _loaded;
//! Sign In email and password
      FirebaseServices.auth.signInWithEmailAndPassword(
        email: emailController.text,
         password:passwordController.text).
         then((value) {
          toastMessage(message: 'Successfully login');
          Navigator.pushReplacementNamed(event.context,Routes.bottomBarScreen);
         }).onError((error, stackTrace) {
          toastMessage(message: error.toString());
         });
    }
    });
//! Sign In Google
    on<GoogleSignInEvent>((event, emit){
     GoogleSignInMethod.signInWithGoogle().then((value) {
          Navigator.pushReplacementNamed(event.context,Routes.bottomBarScreen);

        toastMessage(message: 'Successfully SignIn');
      }).onError((error, stackTrace) {
        toastMessage(message: error.toString());
      });
    });
  }
  
  // ignore: invalid_use_of_visible_for_testing_member
  get _loaded=>emit(LoginButtonState(formKey: _formKey, passwordController: passwordController,emailController: emailController));
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
  
}


