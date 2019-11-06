import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/welcomeScreen.dart';
import 'welcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Widget _getScreenId(){
  //   return StreamBuilder<FirebaseUser>(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot){
  //       if(snapshot.hasData){
  //         return Layout();
  //       }
  //       else{
  //         return WelcomePage();
  //       }
  //     },
  //   );
  // }
  // This widget is the root of your application.
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
          home: StreamBuilder<FirebaseUser>( // if logged in then use app if not logged in start at welcome screen
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context, snapshot){
              if(snapshot.hasData){
              return WelcomePage();
              } else {
                return WelcomePage();
              }
            }),         
    );
  }
}

