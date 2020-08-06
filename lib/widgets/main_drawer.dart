import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            iconData: Icons.restaurant,
            title: 'Meals',
            function: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            iconData: Icons.settings,
            title: 'Filters',
            function: () => Navigator.of(context).pushReplacementNamed(FiltersScreen.ROUTE),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
      {@required IconData iconData,
      @required String title,
      @required Function function}) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: function,
    );
  }
}
