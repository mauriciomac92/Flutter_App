import 'package:flutter/material.dart';
import 'package:software_engineer/MessagePage.dart';
import 'package:software_engineer/ProfilePage.dart';
import 'package:software_engineer/PostPage.dart';

class mainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainPage();
  }
}
// add comment

class _mainPage extends State<mainPage> {
  int _page = 0;
  //PageController _pageController;
  final List<Widget> _children = [
    ProfilePage(),
    MessagePage(),
    PostsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fullerton Messenger'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
