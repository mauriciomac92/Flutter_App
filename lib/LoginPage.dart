import 'package:flutter/material.dart';
import 'package:software_engineer/PageLayout.dart';
import 'package:software_engineer/firebase_google_signin.dart';
import 'package:software_engineer/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() =>
      LoginState(); // => short for: {return LoginState()}
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Center(
            child: Container(
          color: Colors.grey,
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fullerton_logo.png',
                      height: 150.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    OutlineButton(
                        splashColor: Colors.white,
                        onPressed: () {
                          /* original push without google sign */
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen())); //mainpage
                          /* with google sign in
                          signInWithGoogle().whenComplete(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return mainPage();
                              }),
                            );
                          }); */
                        },
                        borderSide: BorderSide(color: Colors.black),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/google_logo.png',
                              height: 45.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign In With Google',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ])),
        )));
  }
}
