import 'package:flutter/material.dart';
import 'package:software_engineer/page.dart';

Widget _login() {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.black45),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.black45),
                  icon: Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )));
}

Widget _logout() {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.black45),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black45),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(36.0),
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
                    _login(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    _logout(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    _signInButton(context),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ])),
        )));
  }
}

Widget _signInButton(BuildContext context) {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainPage()),
      );
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/google_logo.png',
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent,
                ),
              ),
            )
          ],
        )),
  );
}
