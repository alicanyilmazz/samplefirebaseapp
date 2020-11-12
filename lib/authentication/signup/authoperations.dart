import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samplefirebaseapp/screens/components/notifications/insidenotifications.dart';


Future signUpWithEmailAndPassword({FirebaseAuth auth,String email, String password,GlobalKey<ScaffoldState> key}) async {
  var authResult = await auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .catchError((e) {callSnackBar(key: key,message: "This user already exist!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);});

  var firebaseUser = authResult.user;

  if (firebaseUser != null) {
    firebaseUser.sendEmailVerification().then((data) {
      auth.signOut();
    }).catchError((e)   {
      callSnackBar(key: key,message: "Verification email not send your mail please take support our team.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
    });
    //debugPrint("Uid ${firebaseUser.uid} mail ${firebaseUser.email} isEmailVerify : ${firebaseUser.emailVerified}");
  }

}
