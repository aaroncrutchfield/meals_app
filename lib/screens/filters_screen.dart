import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const ROUTE = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(),
      body: Center(child: Text('Filters!')),
    );
  }
}
