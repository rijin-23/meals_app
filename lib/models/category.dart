import 'package:flutter/material.dart';

// ignore: camel_case_types
class Category{
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.red,
    });
}