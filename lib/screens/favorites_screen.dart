import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
   FavoritesScreen({Key? key,required this.favoriteTrip}) : super(key: key);

  final List<Trip> favoriteTrip ;

  @override
  Widget build(BuildContext context) {
    if(favoriteTrip.isEmpty){
      return Center(
        child: Text('ليس لديك اي رحلات في قائمة المفضة'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index){
          return TripItem(
            title: favoriteTrip[index].title,
            imageUrl: favoriteTrip[index].imageUrl,
            tripType: favoriteTrip[index].tripType,
            duration: favoriteTrip[index].duration,
            season: favoriteTrip[index].season,
            id: favoriteTrip[index].id,
            // removeItem: _remove,

          );
        },
        itemCount: favoriteTrip.length ,
      );
    }
  }
}
