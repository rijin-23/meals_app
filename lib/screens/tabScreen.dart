import 'package:flutter/material.dart';

import '../widgets/drawerWidget.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _screens = [
    {'page': Categories_Screen(), 'title': 'Categories'},
    {'page': Favorites_Screen(), 'title': 'Favorites'}
  ];

  int _selectedTabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedTabIndex]['title']),
      ),
      drawer: DrawerWidget(),
      body: _screens[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorites')),
        ],
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedTabIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
