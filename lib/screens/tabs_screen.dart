import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

import '../models/trip.dart';


class TabsScreen extends StatefulWidget {
   TabsScreen({Key? key,required this.favoret}) : super(key: key);

  final List<Trip> favoret;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  void _select(int index){
    setState(() {
      _selectScreen=index;
    });
  }
  int _selectScreen = 0;
    List<Map<String, Widget>>? _screen ;
    List<Map<String, String>>? _title ;
  @override
  void initState() {
    _screen = [
      {
        'Screen': CategoriesScreen(),
      },{
      'Screen': FavoritesScreen(favoriteTrip:widget.favoret),
    },
    ];
    _title = [
      {
        'Title':'تصنيفات الرحلات'
      },{
      'Title': 'الرحلات المفضلة'
    },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title![_selectScreen]['Title']!),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screen![_selectScreen]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _select,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreen,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,),label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star,),label: 'المفضلة'),
        ],
      ),


    );
  }
}
