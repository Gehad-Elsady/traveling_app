import 'package:flutter/material.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const screenRoute = '/filters';

  final Function?  saveFilters;
  final Map<String, bool> current;

  FiltersScreen({required this.saveFilters,required this.current});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  void initState() {
    _Summer = widget.current['summer']!;
    _Winter = widget.current['winter']!;
    _Family = widget.current['family']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        centerTitle: true,
        actions: [
          IconButton(onPressed:(){
            final selectedFilters = {
              'summer' : _Summer,
              'winter' : _Winter,
              'family' : _Family,
            };
            widget.saveFilters!(selectedFilters);
            },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                      title: Text('الرحلات الصيفية'),
                      subtitle: Text('اظهار الرحلات في فصل الصيف فقط'),
                      value: _Summer,
                      onChanged: (newValue){
                        setState(() {
                          _Summer = newValue;
                        });
                      }
                  ),
                  SwitchListTile(
                      title: Text('الرحلات الشتوية'),
                      subtitle: Text('اظهار الرحلات في فصل الشتاء فقط'),
                      value: _Winter,
                      onChanged: (newValue){
                        setState(() {
                          _Winter = newValue;
                        });
                      }
                  ),
                  SwitchListTile(
                      title: Text('للعائلات'),
                      subtitle: Text('اظهار الرحلات للعائلات فقط'),
                      value: _Family,
                      onChanged: (newValue){
                        setState(() {
                          _Family = newValue;
                        });
                      }
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

  // Widget buildSwitchListTile(String title, String subTitle,var value,Function update) {
  //   return SwitchListTile(
  //                 title: Text(title),
  //                   subtitle: Text('اظهار الرحلات في فصل الصيف'),
  //                   value: _isInSommer,
  //                   onChanged: (newValue){
  //                   setState(() {
  //                     _isInSommer = newValue;
  //                   });
  //                   }
  //                   );
  // }
}
