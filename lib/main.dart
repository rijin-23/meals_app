import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tabScreen.dart';
import 'package:meals_app/widgets/dummy_data.dart';
import 'screens/meal_details_screen.dart';
import 'screens/recipes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void applyFilters(Map<String, bool> getFilters) {
    setState(() {
      _filters = getFilters;
      availableMeal = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void selectFavorite(String mealId) {
    final elementIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (elementIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(elementIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(id) {
    return favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.pink, accentColor: Colors.pinkAccent),
      home: TabScreen(favoriteMeal),
      routes: {
        '/recipes': (context) => Recipes_Screen(availableMeal),
        '/meal_details': (context) =>
            Meal_Details_Screen(selectFavorite, isFavorite),
        '/tab_screen': (context) => TabScreen(favoriteMeal),
        '/filter_screen': (context) => FilterScreen(_filters, applyFilters)
      },
    );
  }
}
