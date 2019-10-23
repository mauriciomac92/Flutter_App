import 'package:flutter/material.dart';
import 'package:software_engineer/LoginPage.dart';
import 'package:software_engineer/firebase_google_signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Messenger",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[20],
        accentColor: Colors.white,
      ),
      home: LoginWithGoogle(),
    );
  }
}
