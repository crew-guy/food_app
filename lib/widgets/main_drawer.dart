import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'OpenSans', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Meals',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
