import 'package:flutter/material.dart';
import 'package:software_engineer/messagejUI.dart';
import 'package:software_engineer/page.dart';

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
        title: Text('Messages'),
        leading: Icon(Icons.settings),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'show',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.error),
            tooltip: 'show',
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
                    radius: 24.0,
                    backgroundImage:
                        AssetImage('assets/images/fullerton_logo.png'),
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
