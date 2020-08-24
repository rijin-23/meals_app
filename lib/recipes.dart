import 'package:flutter/material.dart';
import 'models/meal.dart';
import './dummy_data.dart';

class Recipes extends StatelessWidget {

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
        itemBuilder: (context,index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      )
      
    );
  }
}