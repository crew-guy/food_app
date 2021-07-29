import 'package:flutter/material.dart';
import 'package:food_app/screens/category_meals_screen.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/meal_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'OpenSans',
                ),
              )),
      // home: CategoryScreen(),
      initialRoute: "/",
      routes: {
        '/': (ctx) => CategoryScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Khaana khujana')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('hello world'),
        ),
      ),
    );
  }
}
