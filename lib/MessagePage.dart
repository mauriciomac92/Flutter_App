import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'progress.dart';

final userRef = Firestore.instance.collection('messages');
FirebaseUser loggedInUser;
//final int timestamp = DateTime.now().millisecondsSinceEpoch;
final DateTime timestamp = DateTime.now();


class ChatScreen extends StatefulWidget{
  @override
  ChatScreenPage createState() => ChatScreenPage();
}

class ChatScreenPage extends State<ChatScreen>{
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String messageText;
  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
    final user =  await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
      }
    } catch(e) {
      print(e);
    }
  }
  @override 
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('no'),
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
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value){
                        if(value == null) {value = messageText = ' ';}
                        messageText = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Message Here',
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      messageTextController.clear();
                      userRef.add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'time': timestamp,
                      });
                      },
                      child: Icon(Icons.send)
                  )
                ]
              ),
            ),
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
      stream: userRef.orderBy('time',descending: true).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return linearProgress();
        }          
          final messages = snapshot.data.documents.reversed; // messages show to bottom of the list
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final currentUser = loggedInUser.email;

            final messageBubble = MessageBubble(
              sender: messageSender, 
              text: messageText,
              isMe: currentUser == messageSender,
            );

            messageBubbles.add(messageBubble);
          }
          return Expanded( // use this cause listview will take all the screen
            child: ListView(
              reverse: true,// view points to the bottom
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              children: messageBubbles,
            )
          );
      });
  }
}
    
class MessageBubble extends StatelessWidget{

  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white30,
            ),),
            Material(
              borderRadius: isMe ?
              BorderRadius.only(
              topLeft: Radius.circular(30.0), 
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)) :
              BorderRadius.only(
              topLeft: Radius.circular(30.0), 
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0)),
              elevation: 5.0,
              color: isMe? Colors.pinkAccent[100]: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                ),),
              )
            ),
            Text(
              '$timestamp'
            ),
          ],
        ),
    );
  }
}
