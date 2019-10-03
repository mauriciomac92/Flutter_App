import 'package:flutter/material.dart';


class _Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Profile'),
      ),
      body: Container(
        color: Colors.teal,
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Center(
            child: CircleAvatar(
              // place for user to add their avatar
              radius: 70,
              backgroundColor: Colors.grey,
              child: Icon(Icons.add_a_photo),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Card(
            // place for user to input their name
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.work),
              title: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Job",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.contact_mail),
              title: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.contact_phone),
              title: Container(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
