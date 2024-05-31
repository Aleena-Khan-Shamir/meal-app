import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.setFilters, required this.currentFilters});
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget.setFilters(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Text('Adjust your meal selection',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTiles(context, 'Gluten-Free',
                  'Only include gluten-free meals', _glutenFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTiles(context, 'Lactose-Free',
                  'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchTiles(context, 'Vegitarian',
                  'Only include vagitarian meals', _isVegetarian, (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitchTiles(
                  context, 'Vegan', 'Only include vegan meals', _isVegan,
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchTiles(
    BuildContext context,
    String title,
    String subtitle,
    bool value,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (newValue) => updateValue(newValue));
  }
}
