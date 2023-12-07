import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/category_trips_screens.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters={
    'summer' : false,
    'winter' : false,
    'family' : false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filtersData){
    setState(() {
      _filters = filtersData;
      _availableTrips = Trips_data.where((trip){
        if(_filters['summer']== true && trip.isInSummer != true){
          return false;
        }if(_filters['winter']== true && trip.isInWinter != true){
          return false;
        }if(_filters['family']== true && trip.isForFamilies != true){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId){
    final existing = _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if(existing >= 0){
      setState(() {
        _favoriteTrips.removeAt(existing);
      });
    }else{
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id){
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar','AE'), // English
        ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline5: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold
          ),
            headline6: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold
            )
        )
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoret:_favoriteTrips),
        CategoryTripsScreen.screenRoute : (ctx) => CategoryTripsScreen(availableTrips:_availableTrips,),
        TripDetailScreen.screenRoute : (ctx) => TripDetailScreen(manageFavorite:_manageFavorite,isFavorite:_isFavorite),
        FiltersScreen.screenRoute :(ctx) => FiltersScreen(saveFilters:_changeFilters,current: _filters,)
      },
    );
  }
}

