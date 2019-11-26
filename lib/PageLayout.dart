import 'package:flutter/material.dart';
import 'package:testlogin/mess.dart';

import 'MessagePage.dart';
import 'PostsPage.dart';
import 'ProfilePage.dart';
import 'chat.dart';

class MainPage extends StatefulWidget {
  final String userId;
  MainPage({this.userId});
    // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
int _page = 0;
//PageController _pageController;
  final List<Widget> _children = [
    ProfilePage(),
    ChatScreen(),
    PostsPage(),
  ];

@override
Widget build(BuildContext context){
  return Scaffold(
    body: _children[_page], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: Tapped, // new
        currentIndex: _page, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            title: Text('Profile'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Posts'))
        ],
      ),
  );
}

  void Tapped(int page) {
    setState(() {
      _page = page;
    });
  }
}
