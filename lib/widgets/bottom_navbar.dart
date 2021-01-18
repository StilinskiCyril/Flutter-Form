import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.indigo[600]),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'C2B',
              backgroundColor: Colors.indigo[600]),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              label: 'B2C',
              backgroundColor: Colors.indigo[600]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.indigo[600]),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              print('Home clicked');
              break;
            case 1:
              print('c2b clicked');
              break;
            case 2:
              print('b2c clicked');
              break;
            case 3:
              print('profile clicked');
              break;
          }
        },
      ),
    );
  }
}
