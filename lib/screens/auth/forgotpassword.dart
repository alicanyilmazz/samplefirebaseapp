import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/signin.dart';
import '../components/logincomponents.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _rememberMe = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _forgotScaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _forgotScaffoldKey,
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
                        Color(0xFFe1d76a),
                        Color(0xFFe6dd80),
                        Color(0xFFeeaab0),
                        Color(0xFFaaeee8),
                        Color(0xFFaaeee8),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9,0.9],
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
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //Input Area
                      buildEmail(backgroundColor:Color(0xFFeee8aa),iconColor: Colors.orange,textColor: Colors.orange,hintColor: Colors.orange),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildResetPasswordButton(auth: auth,key: _forgotScaffoldKey,buttonName: "Send"),
                      buildSwitchButton(preText: 'Do you remember your password?',postText: 'Sign In',onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));})
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
