import 'package:flutter/material.dart';

// ignore: camel_case_types
class Category_List extends StatelessWidget {

  final String title;
  final Color color;

  Category_List({this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          color.withOpacity(0.5),
          color
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        )
      ),
      child: Center(child: Text(title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25
      ),)),
    );
  }
}