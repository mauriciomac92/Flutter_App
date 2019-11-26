import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'PageLayout.dart';
import 'loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Messenger',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.grey[20],
            accentColor: Colors.white,
          ),
          home: StreamBuilder<FirebaseUser>( // if logged in then use app if not logged in start at login screen
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context, snapshot){
              if(snapshot.hasData){
              return MainPage();
              } else {
                return LoginPage();
              }
            }),    
    );
  }
}

