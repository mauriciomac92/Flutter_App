import 'package:flutter/material.dart';
import 'package:testlogin/auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'nextPage.dart';

class LoginPage extends StatefulWidget {
    static final String id = 'Login_Page';
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final formKey = GlobalKey<FormState>();
String _email;
String _password;
void _submit(){
  if(formKey.currentState.validate()){
    formKey.currentState.save();
    // print(_email);
    // print(_password);
    Auth.login(_email, _password);
  }
}
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login In"
                ),
                Form(key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6 ? 'Must be at lease 6 characters' : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: FlatButton(
                        onPressed: _submit,
                        child: Text(
                          'Login',
                        ),

                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        );
    }
}

