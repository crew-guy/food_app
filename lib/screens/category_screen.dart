import 'package:flutter/material.dart';
import 'package:food_app/widgets/category_item.dart';
import 'package:food_app/data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(14),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(id: cat.id, title: cat.title, color: cat.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
