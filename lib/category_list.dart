import 'package:flutter/material.dart';
import 'recipes.dart';

// ignore: camel_case_types
class Category_List extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_List({this.title,this.color,this.id});

   void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/recipes', arguments: {'title':title,'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () => selectCategory(context),
              borderRadius: BorderRadius.circular(20),
              splashColor: Theme.of(context).primaryColor,
                child:Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.amber,width: 1.5),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          color.withOpacity(0.5),
          color
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        )
      ),
      child: Center(child: FittedBox(
              child: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),),
      )),
    )
    );
  }
}