enum Complexity { Saral, Mehnatwaala, Gaandphaad }

enum Affordability { Sasta, Mehenga, Gaandcheer }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final List<String> ingredients;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isFavourite;

  const Meal({
    required this.id,
    required this.categories,
    required this.affordability,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isFavourite,
  });
}
