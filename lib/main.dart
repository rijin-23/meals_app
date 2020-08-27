import 'package:flutter/material.dart';
import 'screens/recipes_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meals App'),
          backgroundColor: Colors.redAccent,
        ),
        body: Categories_Screen(),
      ),
      routes: {'/recipes': (context) => Recipes_Screen()},
    );
  }
}
