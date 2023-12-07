
import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
   CategoryTripsScreen({Key? key,required this.availableTrips}) : super(key: key);
   static const screenRoute= '/category-trips';
   final List<Trip> availableTrips;
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle;
  List<Trip>? display;
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    final routeArgument =ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    display = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void _remove(String tripId){
    setState(() {
      display?.removeWhere((trip) => trip.id == tripId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return TripItem(
            title: display![index].title,
            imageUrl: display![index].imageUrl,
            tripType: display![index].tripType,
            duration: display![index].duration,
            season: display![index].season,
            id: display![index].id,
            // removeItem: _remove,

          );
        },
        itemCount: display?.length ,
      ),
    );
  }
}
