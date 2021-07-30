import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = "/meal-details";
  final Function toggleFavourite;
  final Function isMealFavourite;

  MealDetailsScreen(this.toggleFavourite, this.isMealFavourite);
  Widget buildSectionTitle(BuildContext context, String text) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ));
  }

  Widget buildSectionContainer(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      width: 350,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionContainer(
              context,
              ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 2,
                        color: Theme.of(context).accentColor,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(selectedMeal.ingredients[index])]),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length),
            ),
            buildSectionTitle(context, 'Steps'),
            buildSectionContainer(
              context,
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Text('#${index + 1}'),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.body1,
                      ));
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFavourite(selectedMeal.id) ? Icons.star : Icons.star_border),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          toggleFavourite(selectedMeal.id);
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
