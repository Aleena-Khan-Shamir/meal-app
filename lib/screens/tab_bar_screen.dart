import 'package:flutter/material.dart';
import 'package:meal_app/model/meal_data.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key, required this.favoriteMeal});
  final List<Meal> favoriteMeal;

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  late List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': const CategoryScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeal),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favorites'),
            ]));
  }
}
