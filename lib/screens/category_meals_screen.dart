import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/category-meals";
  // final String? id;
  // final String? title;

  // CategoryMealsScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var currentMeal = categoryMeals[index];
          return MealItem(
            id: currentMeal.id,
            duration: currentMeal.duration,
            affordability: currentMeal.affordability,
            complexity: currentMeal.complexity,
            title: currentMeal.title,
            imgUrl: currentMeal.imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
