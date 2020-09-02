import 'package:flutter/material.dart';

import 'package:meals_app/screens/tabScreen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/recipes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
      home: TabScreen(),
      routes: {
        '/recipes': (context) => Recipes_Screen(),
        '/meal_details': (context) => Meal_Details_Screen()
      },
    );
  }
}
