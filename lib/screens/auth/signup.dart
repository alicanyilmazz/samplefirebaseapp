import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/changepassword.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samplefirebaseapp/screens/components/logincomponents.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _rememberMe = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _signUpScaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _signUpScaffoldKey,
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
                    Colors.amberAccent.shade400,
                    Colors.orange.shade400,
                    Colors.deepOrange.shade400,
                    Colors.grey.shade400
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                )),
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
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //Input Area
                      buildEmail(backgroundColor:Colors.white38,iconColor: Colors.white,textColor: Colors.blueGrey,hintColor: Colors.white54),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildPassword(Colors.white38),
                      SizedBox(
                        height: 30.0,
                      ),
                      //buildForgotPasswordButton(),
                      //buildRememberMeCheckbox(),
                      buildSignUpButton(auth: auth,buttonName: "Sign Up",key: _signUpScaffoldKey,context: context),
                      buildSwitchButton(preText: 'Do you have a an Account?',postText: 'Sign In',onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));})
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
