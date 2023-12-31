import 'package:flutter/material.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

import '../models/trip.dart';

class TripItem extends StatelessWidget {
   TripItem({Key? key,required this.title,required this.imageUrl,required this.tripType,required this.duration,required this.season,required this.id}) : super(key: key);
 void selectTrip(BuildContext context){
   Navigator.of(context).pushNamed(TripDetailScreen.screenRoute,
   arguments: id).then((result){
     if(result != null){
       // removeItem(result);
     }
   });
 }
 final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removeItem;

  String get seasonText {
    switch (season){
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }
   String get tripTypeText {
     switch (tripType){
       case TripType.Exploration:
         return 'استكشاف';
         break;
       case TripType.Recovery:
         return 'نقاهة';
         break;
       case TripType.Activities:
         return 'انسطة';
         break;
       case TripType.Therapy:
         return 'معالجة';
         break;
       default:
         return 'غير معروف';
     }
   }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ],
                      stops: [
                        0.6,
                        1
                      ]
                    )
                  ),
                  child: Text(title,style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.fade,),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today_rounded,color: Theme.of(context).accentColor,),
                      SizedBox(width: 6,),
                      Text('$duration ايام '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny,color: Theme.of(context).accentColor,),
                      SizedBox(width: 6,),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom,color: Theme.of(context).accentColor,),
                      SizedBox(width: 6,),
                      Text(tripTypeText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
