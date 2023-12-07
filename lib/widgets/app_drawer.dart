import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  // Widget buildListTile(String title,IconData icon,Function onTapLink) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 30,
  //       color: Colors.blue,),
  //     title: Text(title,
  //       style: TextStyle(
  //           fontFamily: 'ElMessiri',
  //           fontWeight: FontWeight.bold,
  //           fontSize: 24),
  //     ),
  //     onTap: (){},
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text('دليلك السياحي',
            style: Theme.of(context).textTheme.headline6,),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(
              Icons.card_travel,
              size: 30,
              color: Colors.blue,),
            title: Text('الرحلات',
              style: TextStyle(
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            onTap: (){Navigator.of(context).pushReplacementNamed('/');},
          ),
          // buildListTile(
          //     'الرحلات',
          //   Icons.card_travel,
          //     (){
          //   Navigator.of(context).pushNamed('/');
          //     }
          // ),
          ListTile(
            leading: Icon(
              Icons.filter_list,
              size: 30,
              color: Colors.blue,),
            title: Text('الفلترة',
              style: TextStyle(
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            onTap: (){Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);},
          ),
          // buildListTile(
          //     'الفلترة',
          //     Icons.filter_list,
          //         (){
          //       Navigator.of(context).pushNamed(FiltersScreen.screenRoute);
          //     }
          // ),
        ],
      ),
    );
  }


}
