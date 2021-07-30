import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(child: Text('You have no favourite meals'));
    }
    ;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        var currentMeal = favouriteMeals[index];
        return MealItem(
          id: currentMeal.id,
          duration: currentMeal.duration,
          affordability: currentMeal.affordability,
          complexity: currentMeal.complexity,
          title: currentMeal.title,
          imgUrl: currentMeal.imageUrl,
          // removeItem: _removeMeal,
        );
      },
      itemCount: favouriteMeals.length,
    );
  }
}
