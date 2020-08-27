import 'package:flutter/material.dart';

// ignore: camel_case_types
class Meal_Details_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String argsId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(child: Text('Meal id is $argsId')),
    );
  }
}
