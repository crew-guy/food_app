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

  String get getComplexity {
    switch (complexity) {
      case Complexity.Saral:
        return 'Saral';
      case Complexity.Mehnatwaala:
        return 'Mehnatwaala';
      case Complexity.Gaandphaad:
        return 'Gaandphaad';
      default:
        return 'Unknown';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Sasta:
        return 'Sasta';
      case Affordability.Mehenga:
        return 'Mehenga';
      case Affordability.Gaandcheer:
        return 'Gaandcheer';
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: InkWell(
        onTap: selectMeal,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imgUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.alarm),
                          SizedBox(width: 6),
                          Text('${duration} min')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 6),
                          Text(getComplexity)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.money),
                          SizedBox(width: 6),
                          Text(getAffordability)
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
