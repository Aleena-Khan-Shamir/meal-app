import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
            height: 140,
            width: double.infinity,
            color: Colors.purple,
            child: Center(
                child: Text('Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)))),
        buildMethod(context, 'Meals', Icons.restaurant, () {
          Navigator.pushReplacementNamed(context, '/');
        }),
        buildMethod(context, 'Filters', Icons.settings, () {
          Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
        }),
      ],
    ));
  }

  ListTile buildMethod(
      BuildContext context, String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      onTap: () => tapHandler(),
      title: Text(text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
