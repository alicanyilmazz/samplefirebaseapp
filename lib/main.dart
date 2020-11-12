import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/changepassword.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/forgotpassword.dart';
import 'file:///S:/AppData/FlutterProjects/samplefirebaseapp/lib/screens/auth/signin.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF202328),
        accentColor: Color(0xFF63CF93),
        backgroundColor: Color(0xFF12171D),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
      routes: {
      },
    );
  }
}
