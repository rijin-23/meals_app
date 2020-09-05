import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'item_screen.dart';

// ignore: camel_case_types
class Favorites_Screen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  Favorites_Screen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(child: Text('Fav Tab'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Item_Screen(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
