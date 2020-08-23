import 'package:flutter/material.dart';
import 'package:meals_app/category_list.dart';
import 'package:meals_app/dummy_data.dart';


// ignore: camel_case_types
class Categories_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Meals App'),
              backgroundColor: Colors.redAccent,
            ),
            body:GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
        children: DUMMY_DATA.map((data) {
          return Category_List(
            title: data.title,
            color: data.colors,
          );

        }).toList(),
        
      ),
          ), 
    );
  }
}