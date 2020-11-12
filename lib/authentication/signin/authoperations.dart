import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samplefirebaseapp/screens/auth/wizard.dart';
import 'package:samplefirebaseapp/screens/components/models/logincomponentmodel.dart';
import 'package:samplefirebaseapp/screens/components/notifications/insidenotifications.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/signin.dart';

Future signInWithEmailAndPassword({FirebaseAuth auth,GlobalKey<ScaffoldState> key, String email, String password,BuildContext context}) async {
  var authResult = await auth
      .signInWithEmailAndPassword(email: email, password: password).then((authenticatedUser) {
        if(!authenticatedUser.user.emailVerified)
        {
          callSnackBar(key: key,message: "please verify your email.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
          auth.signOut();
        }else{
          Navigator.of(context).push(_createRoute());
        }
  }).catchError((e) {
          callSnackBar(key: key,message: "Email or password is incorrect.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  });
/*  var firebaseUser = authResult.user;

  if (firebaseUser != null) {
    firebaseUser.sendEmailVerification().then((data) {
      auth.signOut();
    }).catchError((e) {
      debugPrint("mail error is : $e");
    });
    debugPrint(
        "Uid ${firebaseUser.uid} mail ${firebaseUser.email} isEmailVerify : ${firebaseUser.emailVerified}");
  } else {
    debugPrint("Opps there a problem.");
  }*/
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FormAndTextFormField(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


Future<void> signOut({FirebaseAuth auth,GlobalKey<ScaffoldState> key,BuildContext context}) async {
   if(await auth.currentUser!=null){
     auth.signOut().then((value) {
       SignInModel.password=null;
       SignInModel.email=null;
       SignInModel.phoneNumber=null;
       Navigator.of(context).push(_createRoute2());
     }).catchError((onError){debugPrint("Sign Out Error!");});
   }else{
     Navigator.of(context).push(_createRoute2());
   }
}

void forgotPassword({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String email}){
  auth.sendPasswordResetEmail(email: email).then((value) {
    callSnackBar(key: key,message: "Password reset link sended!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  }).catchError((error){
    callSnackBar(key: key,message: "This user not defined in system!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  });
}

void updatePassword({FirebaseAuth auth,String password,GlobalKey<ScaffoldState> key}) {
  if(auth.currentUser!=null){
    auth.currentUser.updatePassword(password).catchError((onError){
      callSnackBar(key: key,message: "Error! Password was not updated!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
    }).whenComplete(() {
      callSnackBar(key: key,message: "Password was updated successfully.",icon: Icons.done,iconColor: Colors.green,textColor: Colors.green,fontWeight: FontWeight.bold);
    });
  }else{
    callSnackBar(key: key,message: "Please sign in to update the password.",icon: Icons.done,iconColor: Colors.green,textColor: Colors.green,fontWeight: FontWeight.bold);
  }
}

void signInWithGoogle({FirebaseAuth auth,GoogleSignIn googleSignIn,BuildContext context}){
  googleSignIn.signIn().then((result) {
    
    result.authentication.then((googleKeys) {

          AuthCredential credential=GoogleAuthProvider.credential(idToken: googleKeys.idToken,accessToken: googleKeys.accessToken);
          auth.signInWithCredential(credential).then((userAuthResult){
            var user=userAuthResult.user;
            if(user!=null){
              Navigator.of(context).push(_createRoute());
            }
          }).catchError((onError){
            debugPrint("authentication error!");
          });
    }).catchError((onError){
      debugPrint("Google Authentication Error $onError");
    });
    
  }).catchError((error){

    debugPrint("Google Auth Sign In Error $error");

  });
}

void signInWithPhoneNumber({FirebaseAuth auth,BuildContext context,String phoneNumber}) async{
  await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
        debugPrint("sms code : "+phoneAuthCredential.smsCode);
        await auth.signInWithCredential(phoneAuthCredential);
        Navigator.of(context).push(_createRoute());
      },
      verificationFailed: (FirebaseAuthException firebaseAuthException){
        debugPrint("verification failed"+firebaseAuthException.phoneNumber);
      },
    codeSent: (String verificationId, int resendToken) async {
      // Update the UI - wait for the user to enter the SMS code
      String smsCode = 'xxxx';
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(phoneAuthCredential);
    },
      codeAutoRetrievalTimeout: (String verificationId){
        debugPrint("time out verification id : $verificationId");
      },
      timeout: const Duration(seconds: 30),
  );
}