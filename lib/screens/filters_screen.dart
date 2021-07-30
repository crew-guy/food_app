import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = true;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchTile(String titleString, String subtitleString,
      Function tapHandler, bool value) {
    return SwitchListTile(
      title: Text(titleString),
      value: value,
      subtitle: Text(subtitleString),
      onChanged: (value) => tapHandler(value),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(13),
          alignment: Alignment.center,
          child: Text(
            'Filters',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(children: [
            buildSwitchTile('Gluten Free', 'Highlight gluten free meals',
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }, _glutenFree),
            buildSwitchTile('Lactose Free', 'Highlight Lactose free meals',
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }, _lactoseFree),
            buildSwitchTile('Vegetarian', 'Highlight vegetarian meals',
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }, _vegetarian),
            buildSwitchTile('Vegan', 'Highlight Vegan meals', (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }, _vegan),
          ]),
        )
      ]),
    );
  }
}
