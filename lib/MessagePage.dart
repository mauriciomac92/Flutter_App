import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'PageLayout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget{
  @override
  ChatScreenPage createState() => ChatScreenPage();
}

class ChatScreenPage extends State<ChatScreen>{
  final messageTextController = TextEditingController();
  @override 
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () { Auth.logout(); },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessaageStream(),
            TextField(
              
            )
          ],
        ),
      ),
    );
  }
}

class MessaageStream extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('messages').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.green,
            ),
          );
        }
        else{
          final messages = snapshot.data.documents;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];

            final messageBubble = MessageBubble(
              sender: messageSender, 
              text: messageText,);
    
            messageBubbles.add(messageBubble);
          }
          return Expanded( // use this cause listview will take all the screen
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              children: messageBubbles,
            )
          );
        }
      });
  }
}
    
class MessageBubble extends StatelessWidget{

  MessageBubble({this.sender, this.text});

  final String sender;
  final String text;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white30,
            ),),
            Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
              elevation: 5.0,
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                ),),
              )
            ),
          ],
        ),
      
    );
  }
}
