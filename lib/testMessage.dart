import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'User.dart';
import 'SearchPage.dart';
import 'progress.dart';
import 'auth.dart';


final messRef = Firestore.instance.collection("message");

class MessagePage extends StatefulWidget {
  static final String id = 'Message_Page';
  final String currentUserId;
  final String userId;
  MessagePage({this.currentUserId, this.userId});
  @override
  MessageState createState() => MessageState();
}


class MessageState extends State<MessagePage> {
  User userhold;
  void postMessage() async {
    await for(var snapshot in messRef.snapshots()){
      for (var post in snapshot.documents) {
        print(post.data);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Messages"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage())
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Log out"),
              onTap: (){
                Auth.logout();
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: messRef.document().get(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          User user = User.fromDoc(snapshot.data);
          userhold = user;
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FriendStream(),
              ],
            ),
          );
        },
      ),
      );
  }
}
// reads from database
class FriendStream extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: messRef.orderBy("email")
      .snapshots(),// messages show to bottom of the list
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return circularProgress();
        }          
        final posts = snapshot.data.documents;
        List<FriendBox> friendBorders = [];
        for (var post in posts){
          final friendtEmail = post.data['email'];
          final friendText = post.data['text'];

          final friendBorder = FriendBox(
            email: friendtEmail,
            text: friendText,
          );
          friendBorders.add(friendBorder);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            children: friendBorders,
          ),
        );
      });
  }
}
// puts data into container down below
class FriendBox extends StatelessWidget{
  FriendBox({this.email,this.text});
  final String email;
  final String text;

  @override 
  Widget build(BuildContext context){
    return Card(
        child: ListTile(
        title: Text(email),
        subtitle: Text(text),
      ),
    );
  }

}
