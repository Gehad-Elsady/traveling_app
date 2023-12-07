import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screens.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({Key? key,required this.title,required this.imageUrl,required this.id}) : super(key: key);

  final String title;
  final String imageUrl;
  final String id;
  void selsctCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        CategoryTripsScreen.screenRoute,
      arguments: {
          'id': id,
        'title':title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selsctCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl,
            height: 250,
            fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(title,style: Theme.of(context).textTheme.headline6 ,),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15)
            ),
          )
        ],
      ),
    );
  }
}
