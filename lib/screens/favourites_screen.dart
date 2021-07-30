import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('The favourites'));
  }
}
