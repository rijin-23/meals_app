import 'package:flutter/material.dart';
import 'item_screen.dart';
import '../widgets/dummy_data.dart';

// ignore: camel_case_types
class Recipes_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map receivedArgs = ModalRoute.of(context).settings.arguments;
    final title = receivedArgs['title'];
    final id = receivedArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    print(id);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Item_Screen(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
