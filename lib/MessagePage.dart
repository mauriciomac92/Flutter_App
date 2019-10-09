import 'package:flutter/material.dart';
import 'package:software_engineer/messagejUI.dart';
import 'package:software_engineer/PageLayout.dart';
//import 'package:software_engineer/ProfilePage.dart';

class MessagePage extends StatefulWidget {
  @override
  MessageState createState() => MessageState();
}

class MessageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messages'),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mainPage()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainPage()),
              );
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: (context, index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Text(_model.letter),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mainPage()),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
