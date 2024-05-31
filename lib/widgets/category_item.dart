import 'package:flutter/material.dart';
import 'package:meal_app/model/category.data.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;
  void selectCatgory(BuildContext context) {
    Navigator.pushNamed(context, CategoryMealScreen.routeName,
        arguments: {'id': category.id, 'title': category.name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatgory(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.7), category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter)),
        child:
            Text(category.name, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
