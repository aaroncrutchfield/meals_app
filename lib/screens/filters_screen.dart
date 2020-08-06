import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  Widget _buildSwitchListTile(
      {@required String title,
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

  void _saveSelectedFilters() {
    final selectedFilters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegetarian': _vegetarian,
      'vegan': _vegan,
    };
    widget.saveFilters(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveSelectedFilters,
          )
        ],
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
