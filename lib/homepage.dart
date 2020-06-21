import 'package:flutter/material.dart';
import 'package:wecare/IndiaPage.dart';
import 'package:wecare/countryPage.dart';
import 'package:wecare/faqs.dart';
import 'package:wecare/india.dart';
//import 'package:wecare/countryPage.dart';


class HomePage extends StatefulWidget {
  static const String id = 'homepage_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    IndiaPage(),
    countryPage(),
    FAQ(),
  ];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broken_image),
            title: Text("World"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere),
            title: Text("FAQ\'s"),
          ),
        ],
      ),
    );
  }
}
