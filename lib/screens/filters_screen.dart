import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE = '/filter';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitchListTile({@required String title,
      @required String description,
      @required bool currentValue,
      @required Function update}) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals',
                  currentValue: _glutenFree,
                  update: (newValue) => setState(() => _glutenFree = newValue),
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only include lactose-free meals',
                  currentValue: _lactoseFree,
                  update: (newValue) => setState(() => _lactoseFree = newValue),
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals',
                  currentValue: _vegetarian,
                  update: (newValue) => setState(() => _vegetarian = newValue),
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include vegan meals',
                  currentValue: _vegan,
                  update: (newValue) => setState(() => _vegan = newValue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
