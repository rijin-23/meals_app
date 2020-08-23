import 'package:flutter/material.dart';

// ignore: camel_case_types
class Categories_class{
  final String id;
  final String title;
  final Color colors;

  const Categories_class({
    @required this.id,
    @required this.title,
    this.colors = Colors.red,
    });
}