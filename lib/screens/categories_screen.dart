import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 40,
          crossAxisSpacing: 10
        ),
        children: Categories_data.map( (categoryData)=> CategoryItem(title: categoryData.title, imageUrl: categoryData.imageUrl,id: categoryData.id,) ).toList(),
      );
  }
}
