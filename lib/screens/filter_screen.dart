import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawerWidget.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Text('Filter Screen'),
      ),
    );
  }
}
