import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormAndTextFormField extends StatefulWidget {
  @override
  _FormAndTextFormFieldState createState() => _FormAndTextFormFieldState();
}

class _FormAndTextFormFieldState extends State<FormAndTextFormField> {
  String _name, _surname, _password, _emailAddress;
  bool autoValidate = false;
  final GlobalKey<ScaffoldState> _wizardScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.grey,
        primaryColor: Color(0xFF214b52),
        errorColor: Colors.red,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF214b52),
          title: Text(
            "Personal Information",
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: InkWell(
            onTap: () {}, //FocusScope.of(context).unfocus()
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    /*image: const DecorationImage(
                      image: NetworkImage('https://images.pexels.com/photos/2317685/pexels-photo-2317685.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                      fit: BoxFit.cover,
                    ),*/
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.amberAccent.shade400,
                        Colors.orange.shade400,
                        Colors.orange.shade400,
                        Colors.deepOrange.shade400,
                      ],
                      //stops: [0.1, 0.4, 0.7, 0.9],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          buildNameField(),
                          buildSurnameField(),
                          buildEmailField(),
                          buildPasswordField(),
                          RaisedButton.icon(
                            elevation: 5.0,
                            onPressed: () {},
                            icon: Icon(Icons.send_rounded),
                            label: Text("Save"),
                            color: Colors.orange,
                            disabledColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              //prefix: Icon(Icons.email),
              prefixIcon: Icon(Icons.lock_outline),
              //prefix: Text("ssad"),
              hintText: "Please enter your password",
              labelText: "Password",
              border: InputBorder.none,
            ),
            //initialValue: "firs value",
            validator: validatePassword,
            onSaved: (val) => _password = val,
          ),
        ),
      ),
    );
  }

  Padding buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              //prefix: Icon(Icons.email),
              prefixIcon: Icon(Icons.email_outlined),
              //prefix: Text("ssad"),
              hintText: "Please email address",
              labelText: "Email",
              border: InputBorder.none,
            ),
            //initialValue: "firs value",
            validator: validateEmail,
            onSaved: (val) => _emailAddress = val,
          ),
        ),
      ),
    );
  }

  Padding buildSurnameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        width: 580,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              //prefix: Icon(Icons.account_circle),
              hintText: "Please enter surname",
              labelText: "Surname",
              border: InputBorder.none,
            ),
            //initialValue: "firs value",
            validator: (String val) {
              if (val.length < 3) {
                return "Your surname must be greater than 3.";
              } else {
                return null;
              }
            },
            onSaved: (val) => _surname = val,
          ),
        ),
      ),
    );
  }

  Padding buildNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              //prefix: Text("ssad"),
              hintText: "Please enter name",
              labelText: "Name",
              border: InputBorder.none,
            ),
            //initialValue: "firs value",
            validator: (String val) {
              if (val.length < 3) {
                return "Your name must be greater than 3.";
              } else {
                return null;
              }
            },
            onSaved: (val) => _name = val,
          ),
        ),
      ),
    );
  }


  Padding buildInputField({@required Color backgroundColor,Icon prefixIcon,String hintText,String labelText,String Function(String) inputValidator,void Function(String) inputOnSaved}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              //prefix: Text("ssad"),
              hintText: hintText,
              labelText: labelText,
              border: InputBorder.none,
            ),
            //initialValue: "firs value",
            validator: inputValidator,
            onSaved: inputOnSaved,
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[?!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return "uppercase , lowercase , number , special character and 8 length";
    }
  }

  void _validateEntrance() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Input mail : $_emailAddress Input pass : $_password  Input namesurname : $_name");
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }
}
/*
  enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 2)),
                            ),
 */
