import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_list.dart';
import 'package:meals_app/widgets/dummy_data.dart';

// ignore: camel_case_types
class Categories_Screen extends StatelessWidget {
  //List<Meal> allMeals;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((data) {
        return Category_List(
          title: data.title,
          color: data.color,
          id: data.id,
        );
      }).toList(),
    );
  }
}
