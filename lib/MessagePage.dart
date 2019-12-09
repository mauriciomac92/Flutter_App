import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'progress.dart';
import 'auth.dart';
import 'PageLayout.dart';

class MessagePage extends StatefulWidget {
  @override
  MessageState createState() => MessageState();
}

final userRef = Firestore.instance.collection('friends');

class MessageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Messages"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
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
      body: FriendStream(),
      );
  }
}

class FriendStream extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: userRef.snapshots(),// messages show to bottom of the list
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return linearProgress();
        }          
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index) => _friend(snapshot.data.documents[index]),
          );
      });
  }
}

Widget _friend(DocumentSnapshot document){
  return ListTile(
    title: Text(document['receiver']),
  );
}
