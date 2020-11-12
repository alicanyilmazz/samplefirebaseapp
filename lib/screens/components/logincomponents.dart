import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samplefirebaseapp/authentication/signin/authoperations.dart';
import 'package:samplefirebaseapp/authentication/signup/authoperations.dart';
import 'package:samplefirebaseapp/screens/components/styles/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/logincomponentmodel.dart';
import 'notifications/insidenotifications.dart';

Column buildEmail({Color backgroundColor,Color iconColor,Color hintColor,Color textColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Email',
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',),
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color:backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: iconColor,
            ),
            hintText: "Enter your email",
            hintStyle:  TextStyle(
              color: hintColor,
              fontFamily: 'OpenSans',
            ),
          ),
          onChanged: (String val){
            SignInModel.email=val;
          },
        ),
      ),
    ],
  );
}

Column buildPhoneNumber({Color backgroundColor,Color iconColor,Color hintColor,Color textColor}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Phone',
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',),
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color:backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: iconColor,
            ),
            hintText: "Enter your phone number",
            hintStyle:  TextStyle(
              color: hintColor,
              fontFamily: 'OpenSans',
            ),
          ),
          onChanged: (String val){
            SignInModel.phoneNumber="+9$val";
          },
        ),
      ),
    ],
  );
}

Column buildPassword(Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Password',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',),),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: "Enter your password",
            hintStyle: TextStyle(
              color: Colors.white54,
              fontFamily: 'OpenSans',
            ),
          ),
          onChanged: (String val){
            SignInModel.password=val;
          },
        ),
      ),
    ],
  );
}

//{FirebaseAuth auth,GlobalKey<ScaffoldState> key,String email,Function onTap}

Container buildForgotPasswordButton({Function onTap}) {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      child: Text("Forgot Password?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),),
      padding: EdgeInsets.only(right: 0.0),
      onPressed: onTap,
    ),
  );
}

Container buildSignInWithPhoneButton({FirebaseAuth auth,BuildContext context,String buttonName}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0,),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        if(auth!=null && SignInModel.phoneNumber!=null){
          signInWithPhoneNumber(auth: auth,phoneNumber:SignInModel.phoneNumber,context: context);
        }
      },
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(buttonName,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}



Container buildResetPasswordButton({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String buttonName}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0,),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        if(auth!=null && SignInModel.email!=null){
          forgotPassword(auth: auth,key: key,email: SignInModel.email);
        }
      },
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(buttonName,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Container buildUpdatePasswordButton({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String buttonName}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0,),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        if(auth!=null && SignInModel.password!=null){
          updatePassword(auth: auth,key: key,password: SignInModel.password);
        }
      },
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(buttonName,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Container buildSignUpButton({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String buttonName,BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0,),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
       if(auth!=null && SignInModel.email!=null && SignInModel.password!=null){
         signUpWithEmailAndPassword(auth:auth,email:SignInModel.email,password:SignInModel.password,key: key);
       }
      },
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(buttonName,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Container buildSignInButton({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String buttonName,BuildContext context}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0,),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        if(auth!=null && SignInModel.email!=null && SignInModel.password!=null){
          signInWithEmailAndPassword(auth:auth,key: key,email:SignInModel.email,password:SignInModel.password,context: context);
        }
      },
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(buttonName,
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Column buildSignWithText({String text}) {
  return Column(
    children: [
      Text('-OR-',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(text,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),)
    ],
  );
}


InkWell buildImageSocialButton({Function onTap,AssetImage logo}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}


InkWell buildSwitchButton({String preText,String postText,Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: RichText(text: TextSpan(children: [
      TextSpan(text: preText,style: TextStyle(color: Colors.white)),
      TextSpan(text: ' $postText',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
    ]),),
  );
}