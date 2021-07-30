import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = "/category-meals";
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  String? categoryId;
  List<Meal>? categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      categoryMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(mealId) {
    setState(() {
      categoryMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var currentMeal = categoryMeals![index];
          return MealItem(
            id: currentMeal.id,
            duration: currentMeal.duration,
            affordability: currentMeal.affordability,
            complexity: currentMeal.complexity,
            title: currentMeal.title,
            imgUrl: currentMeal.imageUrl,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals!.length,
      ),
    );
  }
}
