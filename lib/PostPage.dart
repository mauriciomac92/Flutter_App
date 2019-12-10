import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software_engineer/User.dart';
import 'CreatePosts.dart';
import 'constants.dart';

final _firestore = Firestore.instance;

class PostsPage extends StatefulWidget {
  static final String id = 'Post_Page';
  final String currentUserId;
  final String userId;

  PostsPage({this.currentUserId, this.userId});
  @override
  _PostsPage createState() => _PostsPage();
}

class _PostsPage extends State<PostsPage> {

  User userhold;
  //final String currentUserId = currentUserId.id;
  void postsStream() async {
    await for (var snapshot in _firestore.collection('posts').snapshots()) {
      for (var post in snapshot.documents) {
        print(post.data);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User user = User.fromDoc(snapshot.data);
            userhold = user;
            //_displayButton(user);
            return SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PostsStream(),
                  ]
                  // _displayButton(user),
                  ),
            );
          },
          /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyCustomForm()));
        },
        child: Icon(Icons.add),
      ),*/
          //_displayButton(user),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyCustomForm(
                user: userhold,
              ),
            ),
          ),
          child: Icon(Icons.add),
        ));
  }
}

class PostsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final posts = snapshot.data.documents;
          List<PostsBorder> postsBorders = [];
          for (var post in posts) {
            final postText = post.data['text'];
            final postUser = post.data['user'];
            final postHandle = post.data['userHandle'];
            final postImage = post.data['imageUser'];

            final postBorder = PostsBorder(
              user: postUser,
              text: postText,
              userHandle: postHandle,
              imageUser: postImage,
            );
            postsBorders.add(postBorder);
          }
          return Expanded(
            child: ListView(
              children: postsBorders,
            ),
          );
        });
  }
}

class PostsBorder extends StatelessWidget {
  PostsBorder({this.user, this.text, this.userHandle, this.imageUser});
  final String user;
  final String text;
  final String userHandle;
  final String imageUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10.0),
      //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(21, 32, 43, 1.0),
          border: Border(bottom: BorderSide())),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(imageUser),
            //'gs://fullertonmessenger.appspot.com/pikachu.jpg'),
            //'https://firebasestorage.googleapis.com/v0/b/fullertonmessenger.appspot.com/o/pikachu.jpg?alt=media&token=5c7f880b-a315-4a46-8405-1118a8a71bef'),
          ),
          _tweetContent()
        ],
      ),
    );
  }

  Widget _tweetContent() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(user,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(userHandle + " · 30m",
                      style: TextStyle(color: Colors.grey[400])),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text, style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
