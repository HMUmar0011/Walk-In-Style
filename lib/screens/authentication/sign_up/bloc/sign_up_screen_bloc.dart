
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/components/sign_in_with_google.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc_event.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc_state.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/model/user_details.dart';
import 'package:walkinstyleapp/services/firebase_services.dart';
import 'package:walkinstyleapp/widgets/custom_toast.dart';
class SignUpBloc extends Bloc<SignUpScreenBlocEvent,SignUpScreenBlocState> {
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  
    // !UserDetails Model Class
  final UserDetails _userInfo = UserDetails();
  SignUpBloc():super(SignUpScreenInitialState()){
    loadedState;
    on<SignUpButtonEvent>((event, emit) {
      if (_formKey.currentState!.validate()) {
         loadedState;
        FirebaseServices.auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString())
          .then((value) {
           // Add User Details
           addUserDetails();
            toastMessage(message: 'Successfully Sign Up');
            Navigator.pushReplacementNamed(event.context,Routes.login);
          }).onError((error, stackTrace) {
            toastMessage(message: error.toString());
          });
       
      }
    });
     on<GoogleSignInEvent>((event, emit){
      GoogleSignInMethod.signInWithGoogle().then((value) {
        Navigator.pushReplacementNamed(event.context,Routes.bottomBarScreen);
        toastMessage(message: 'Successfully SignIn');
      }).onError((error, stackTrace) {
        toastMessage(message: error.toString());
      });
    });
  }
  addUserDetails(){
     //! Add data to User Details 
          String  id=_userInfo.id=FirebaseServices.currentUser.uid;
            _userInfo.emailAddress=emailController.text.trim();
            _userInfo.name=nameController.text.trim();
            _userInfo.userImage='xyz';

            //! Store data to Firestore
            FirebaseServices.fireStore.collection('userDetails').doc(id)
            .set(_userInfo.toMap()).then((value) {
              log(id);
              toastMessage(message: 'Data Successfully Added');
            }).onError((error, stackTrace) {
             toastMessage(message: error.toString());
             log(error.runtimeType.toString());
            });

  }
  // ignore: invalid_use_of_visible_for_testing_member
  get loadedState=>emit(SignUpButtonState(formKey: _formKey, nameController: nameController, passwordController: passwordController, emailController: emailController));
  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}