import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class PostsPage extends StatefulWidget {
  @override
  static final String id = 'Post_Page';
  _PostsPage createState() => _PostsPage();
}

class _PostsPage extends State<PostsPage> {
//  void getPosts() async {
//    final posts = await _firestore.collection('posts').getDocuments();
//    for (var post in posts.documents) {
//      print(post.data);
//    }
//  }
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
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
          PostsStream(),
        ])));
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

            final postBorder = PostsBorder(
              user: postUser,
              text: postText,
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
  PostsBorder({this.user, this.text});
  final String user;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blueGrey,
          child: Text(
            '$text from $user',
            style: TextStyle(fontSize: 30.0),
          ),
        ));
  }
}
