import 'package:flutter/material.dart';
import 'package:meal_app/model/category.data.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: Category.dummyData
            .map((categoryData) => CategoryItem(category: categoryData))
            .toList());
  }
}
