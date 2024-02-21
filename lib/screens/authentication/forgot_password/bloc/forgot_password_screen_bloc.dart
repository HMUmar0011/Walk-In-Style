 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/forgot_password/bloc/forgot_password_screen_state.dart';
import 'package:walkinstyleapp/services/firebase_services.dart';
import 'package:walkinstyleapp/widgets/custom_toast.dart';

class ForgotPasswordScreenCubit extends Cubit<ForgotPasswordScreenState> {
  TextEditingController emailController=TextEditingController();
  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  ForgotPasswordScreenCubit() : super(ForgotPasswordScreenInitialState()){
    _loaded;
    
  }
  recoveredPassword(BuildContext context){
    if (_key.currentState!.validate()) {
       _loaded;
      FirebaseServices.auth.sendPasswordResetEmail(email: emailController.text).then((value) {
    toastMessage(message:'Recover password through ${emailController.text}');
      Navigator.pushReplacementNamed(context,Routes.login);

      }).onError((error, stackTrace) {
        toastMessage(message: error.toString());
      });
       
    }
  }
  get _loaded=>emit(ForgotPasswordButtonState(formKey:_key, emailController: emailController));
} 
  
