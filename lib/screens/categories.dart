import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/widgets/meals.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  /*  Selected Function to show category */
  void _selected(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => MealsSCreen(
              meals: filteredMeal,
              tiltle: category.title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final categorie in availableCategories)
          CategoryGridItem(
            category: categorie,
            onSelected: () {
              _selected(context, categorie);
            },
          )
      ],
    );
  }
}
