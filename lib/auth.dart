import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'PageLayout.dart';

class Auth {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(
    BuildContext context, String username, String email, String password) async {
      try{
        AuthResult authResult = 
        await _auth.createUserWithEmailAndPassword(email: email, password: password,);
        FirebaseUser signedInUser = authResult.user;
        if(signedInUser != null){
          _firestore.collection('books').document().setData({
            'name': username,
            'email': email,
          });
          // use pushReplacement becuase we don't want the user to go back to login screen
          Navigator.push(context,MaterialPageRoute(builder: (context) => MainPage()),);
        }
      }
      catch(e){
        print(e);
      }
    }

    static void logout(){
      _auth.signOut();
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()),);
    }

    static void login(String email, String password) async {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
}
