import 'package:flutter/material.dart';
import 'package:flutter_form/screens/main_drawer.dart';
import 'package:flutter_form/widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iam_Stilinski24'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print('clicked');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              print('clicked');
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.indigo[600],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0),
        child: Text('Welcome to the homepage'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
