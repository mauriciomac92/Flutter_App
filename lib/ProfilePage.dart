import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircleAvatar(
                // place for user to add their avatar
                radius: 70,
                backgroundColor: Colors.grey,
                child: Icon(Icons.add_a_photo),
              ),
              ),
              SizedBox(height: 25.0),
              Text(
                'Username',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                'Bio',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '24K',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'FOLLOWERS',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '31',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Posts',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '21',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:18.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Following',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey),
                        )
                      ],
                    )
                  ],
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
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 18.0),
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
                    child: Text(
                      'Occupation',
                      style: TextStyle(fontSize: 18.0),
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
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 18.0),
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
                    child: Text(
                      'Phone',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
