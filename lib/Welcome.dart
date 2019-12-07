import 'package:flutter/material.dart';
import 'register.dart';
import 'LoginPage.dart';

class WelcomePage extends StatefulWidget {
  static final String id = 'Welcome_Paga';
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
@override 
Widget build(BuildContext context){
  return Scaffold(
    body: Center(
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
                      child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/fullerton_logo.png',
                    height: 200.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.push( context,
                      MaterialPageRoute(builder:(context) => LoginPage()));
                    },
                    child: Text('login in', style: TextStyle(fontSize: 30.0),),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.push( context,
                      MaterialPageRoute(builder:(context) => RegisterPage()));
                    },
                    child: Text('register', style: TextStyle(fontSize: 30.0),),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ),
  );
}

}
