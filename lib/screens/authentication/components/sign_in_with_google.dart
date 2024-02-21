import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/model/user_details.dart';
import 'package:walkinstyleapp/services/firebase_services.dart';
import 'package:walkinstyleapp/widgets/custom_toast.dart';
abstract class GoogleSignInMethod {
   static UserDetails userInfo = UserDetails();
  static Future<UserCredential?> signInWithGoogle() async {
    
    try {
      
   
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseServices.auth.signInWithCredential(credential)
  .then((value) async{
     userInfo.id = FirebaseServices.currentUser.uid;
        userInfo.name = FirebaseServices.currentUser.displayName.toString();
        userInfo.emailAddress = FirebaseServices.currentUser.email.toString();
        userInfo.userImage = FirebaseServices.currentUser.photoURL.toString();
        // !create user help of Using Google process store data fireStore Database .
        await FirebaseServices.fireStore
            .collection("userDetails")
            .doc(FirebaseServices.currentUser.uid)
            .set(userInfo.toMap())
            .then((value) {
          log("store data");
          // Correctly (Google SignUp) Push HomePage Screen
        }).onError((error, stackTrace) {
          log("Error : $error");
        });
        return FirebaseServices.auth.signInWithCredential(credential);
      });
    
     } catch (e) {
      toastMessage(message: e.toString());
      return null;
    }

  }}



