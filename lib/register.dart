import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';

class RegisterPage extends StatefulWidget {
  // This widget is the root of your application.
  static final String id = 'Register_Page';
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final formKey = GlobalKey<FormState>();
String _email, _password, _username;

_submit(){
  if(formKey.currentState.validate()){
    formKey.currentState.save();
    // print(_email);
    // print(_password);
    // print(_username);
    // logging in the user with Firebase
    Auth.signUpUser(context, _username, _email, _password);
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
                  "Register"
                ),
                Form(key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'username'),
                        // trim makes whitespace unvalid as well
                        validator: (input) => input.trim().isEmpty ? 'Enter a valid username' : null,
                        onSaved: (input) => _username = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
                        onSaved: (input) => _email = input,
                        keyboardType: TextInputType.emailAddress,
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
                          'Register',
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

