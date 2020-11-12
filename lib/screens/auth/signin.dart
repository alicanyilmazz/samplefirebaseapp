import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samplefirebaseapp/authentication/signin/authoperations.dart';
import 'package:samplefirebaseapp/screens/auth/signup.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/forgotpassword.dart';
import '../components/logincomponents.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signinwithphone.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _rememberMe = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _error=true;
  final GlobalKey<ScaffoldState> _signInScaffoldKey = new GlobalKey<ScaffoldState>();
  final GoogleSignIn googleSignIn=GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.authStateChanges().listen((user) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _signInScaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light,
        child: InkWell(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.shade400,
                        Color(0xFFccac00),
                        Color(0xFFf68a00),
                        Color(0xFFff8c00),
                      ],
                      //stops: [0.1, 0.4, 0.7, 0.9],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SignIn Head Text
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //Input Area
                      buildEmail(backgroundColor:Color(0xFFffab61),iconColor: Colors.white,textColor: Colors.white,hintColor: Colors.white54),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildPassword(Color(0xFFffab61)),
                      buildForgotPasswordButton(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));}),
                      buildRememberMeCheckbox(),
                      buildSignInButton(auth: auth,key: _signInScaffoldKey,buttonName: "Sign In",context: context),
                      //buildSignWithText(),
                      buildSignWithText(text: 'Sign In With'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildImageSocialButton(onTap:(){signInWithGoogle(auth: auth,googleSignIn: googleSignIn,context: context);}, logo: AssetImage('assets/logos/google.jpg') ),
                            buildImageSocialButton(onTap:(){debugPrint("facebook");}, logo:AssetImage('assets/logos/facebook.jpg') ),
                            buildImageSocialButton(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInWithPhone()));}, logo:AssetImage('assets/logos/phone.png') ),
                          ],
                        ),
                      ),
                      buildSwitchButton(preText: 'Don\'t have a an Account?',postText: 'Sign Up',onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Remember me",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
        ],
      ),
    );
  }

}

