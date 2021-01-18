import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Colors.indigo[600],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/52662869?s=400&u=320411d48fb3d20941934b12ce9015b61a059e8c&v=4'),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    'Cyril Aguvasu',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    'aguvasucyril@gmail.com',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              print('profile clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              'C2B',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              print('c2b clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on_outlined),
            title: Text(
              'B2C',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              print('b2c clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout // TOGGLE',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              print('logout clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(
              'Login // TOGGLE',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              //prevent the drawer from popping back
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/login");
            },
          )
        ],
      ),
    );
  }
}
