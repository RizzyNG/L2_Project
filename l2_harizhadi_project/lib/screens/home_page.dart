import 'package:flutter/material.dart';

import 'package:l2_harizhadi_project/Screens/About.dart';
import 'package:l2_harizhadi_project/Screens/Profile.dart';
import 'package:l2_harizhadi_project/Screens/BookingScreens/ProductPage.dart';
import 'package:l2_harizhadi_project/screens/LocationScreens/Location.dart';
import 'package:l2_harizhadi_project/screens/BlogScreens/blogpage.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  int _currentIndex = 0;
  final List _children = [
    BlogPage(),
    ProductPage(),
    LocationPage(),
    About(),
    LoginProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue[400],
              icon: Icon(Icons.auto_stories),
              label: ('Blog')),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[400],
            icon: new Icon(Icons.book),
            label: ('Bookings'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue[400],
            icon: new Icon(Icons.directions),
            label: ('Locations'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.info),
            backgroundColor: Colors.blue[400],
            label: ('About'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue[400],
              icon: Icon(Icons.person),
              label: ('Profile'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
