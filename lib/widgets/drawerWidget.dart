import 'package:flutter/material.dart';

import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tabScreen.dart';

class DrawerWidget extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Center(
              child: Text(
                'Cooking Food!',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/tab_screen');
          }),
          buildListTile('Filter', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed('/filter_screen');
          })
        ],
      ),
    );
  }
}
