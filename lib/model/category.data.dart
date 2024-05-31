import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;
  Category({
    required this.id,
    required this.name,
    required this.color,
  });
  static final dummyData = [
    Category(id: 'c1', name: 'Italian', color: Colors.purple),
    Category(id: 'c2', name: 'Hamburgers', color: Colors.red),
    Category(id: 'c3', name: 'Frito Burger', color: Colors.amber),
    Category(id: 'c4', name: 'French', color: Colors.orange),
    Category(id: 'c5', name: 'Quick & Easy', color: Colors.blue),
    Category(id: 'c6', name: 'Summer', color: Colors.teal),
    Category(id: 'c7', name: 'Breakfast', color: Colors.pink),
    Category(id: 'c8', name: 'Asian', color: Colors.grey),
    Category(id: 'c9', name: 'Exotic', color: Colors.green),
    Category(id: 'c10', name: 'Light & Lovely', color: Colors.indigo),
  ];
}
