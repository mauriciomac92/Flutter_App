import 'package:flutter/material.dart';
import 'package:software_engineer/GoogleLogin.dart';

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
      home: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return GoogleLogin();
          }),
    );
  }
}
