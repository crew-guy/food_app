import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final String title;
  final String imgUrl;

  const MealItem({
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.title,
    required this.imgUrl,
  });

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: selectMeal,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        imgUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                ])
              ],
            ),
          ),
        )
      ],
    );
  }
}
