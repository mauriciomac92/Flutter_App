import 'dart:async';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPage createState() => _PostsPage();
}

class _PostsPage extends State<PostsPage> {
  List<int> post = List.generate(10, (i) => i);
  ScrollController scroller = new ScrollController();
  bool reloading = false;

  @override
  void initState() {
    super.initState();
    scroller.addListener(() {
      if (scroller.position.pixels == scroller.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  @override
  void dispose() {
    scroller.dispose();
    super.dispose();
  }

  getMoreData() async {
    if (!reloading) {
      setState(() => reloading = true);
      List<int> newData = await pullData(post.length, post.length + 10);
      if (newData.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom =
            scroller.position.maxScrollExtent - scroller.position.pixels;
        if (offsetFromBottom < edge) {
          scroller.animateTo(scroller.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500), curve: Curves.easeOut);
        }
      }
      setState(() {
        post.addAll(newData);
        reloading = false;
      });
    }
  }

  Widget createReloadAnimation() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: reloading ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: post.length + 1,
        itemBuilder: (context, index) {
          if (index == post.length) {
            return createReloadAnimation();
          } else {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.account_circle,
                              size: 50.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            "$index m",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    new Flexible(
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 12.0, 12.0, 0.0),
                              child: Text(
                                "User/Club # $index",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 12.0, 6.0),
                              width: 300.0,
                              child: new Column(
                                children: <Widget>[
                                  new Text(
                                      "This is where posts will gooooooooooo fbegbhegherkghkjerwhg wekrhgfkwjerhgkwrehg rgkherwkghwe",
                                      textAlign: TextAlign.left),
                                ],
                              ),
                            )
                          ]),
                    )
                  ],
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            );
          }
        },
        controller: scroller,
      ),
    );
  }

  Future<List<int>> pullData(int currentLength, int newLength) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(newLength - currentLength, (i) => i + currentLength);
    });
  }
}

