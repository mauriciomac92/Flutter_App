import 'package:flutter/material.dart';
import 'Color_scheme.dart';

class mainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainPage();
  }
}

class _mainPage extends State<mainPage> {
  int _page = 0;
  PageController _pageController;
  final List<Widget> _children = [
    //PlaceholderWidget(Colors.white),
    //Text('In the Home Category'),
    Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Text("This is the main page"),
      ),
      color: Colors.lightBlue,
    ),
    Color_scheme(Colors.cyan),
    //Center(
    //child: Container(
    //color: Color.fromARGB(255, 66, 165, 245),
    //alignment: Alignment.topLeft,
    //child: Container(
    //color: Colors.blueAccent,
    //child: Text("This is where posts will go"),
    //constraints: BoxConstraints.expand(height: 75.0),
    //),
    //),
    //),
    Container(
      //margin: EdgeInsets.symmetric(vertical: 20.0),
      //height: 200.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            //alignment: Alignment.topLeft,
            height: 250.0,
            color: Colors.red,
          ),
          Container(
            //alignment: Alignment.center,
            height: 250.0,
            color: Colors.blue,
          ),
          Container(
            //alignment: Alignment.bottomCenter,
            height: 250.0,
            color: Colors.green,
          ),
          Container(
            //alignment: Alignment.topLeft,
            height: 250.0,
            color: Colors.yellow,
          ),
          Container(
            //alignment: Alignment.topLeft,
            height: 250.0,
            color: Colors.orange,
          ),
        ],
      ),
    ),
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
