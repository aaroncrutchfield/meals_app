import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE = '/category-meals';


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs[CategoryItem.ARG_TITLE];
    final categoryId = routeArgs[CategoryItem.ARG_ID];
    return Scaffold(
	    appBar: AppBar(),
      body: ListView.builder(itemBuilder: (ctx, index) {

      },),
    );
  }
}
