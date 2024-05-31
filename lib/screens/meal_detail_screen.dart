import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/model/meal_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.toggleFavorite, required this.isFavorite});
  static const routeName = '/meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = Meal.meal.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavorite(mealId),
          child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              height: 220,
              width: double.infinity,
              imageUrl: selectedMeal.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(color: Colors.pink),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Text('Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 180,
              width: 220,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (_, index) => Card(
                        color: Colors.cyan,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      )),
            ),
            const SizedBox(height: 10),
            Text('Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (_, index) => Column(
                          children: [
                            ListTile(
                              leading:
                                  CircleAvatar(child: Text('#${index + 1}')),
                              title: Text(
                                selectedMeal.steps[index],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const Divider()
                          ],
                        ))),
          ],
        ),
      ),
    );
  }
}
