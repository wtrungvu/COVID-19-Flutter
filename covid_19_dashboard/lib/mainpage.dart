import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_dashboard/overall.dart';
import 'package:covid_19_dashboard/detail.dart';
import 'fetch.dart';
class Worldwide extends StatefulWidget{
  List province;
  var value;
  var info;
  List countries;
  Map map;
  Map mymap;
  Map date;
  Worldwide({@required this.value, this.province, this.info, this.countries, this.map,  this.mymap, this.date});

  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  RoutePage r =  RoutePage();
  int index = 0;
  int _currentIndex = 0;
  PageController _pageController;
  bool haha = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context){
    var _page = [
      Listshow(info: widget.info,  value: widget.value, mymap: widget.mymap, province: widget.province),
      Countrydata(value: widget.value, info: widget.info, countries: widget.countries, map: widget.map, mymap: widget.mymap, date: widget.date)
    ];
    return SafeArea(
      child: Scaffold(
      body: 
        //children[_currentIndex],
        SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              _page[0],
              _page[1],
              Center(child: Text("AWWWWWW "))
            ],
          ),
        ),

       bottomNavigationBar: BottomNavyBar(
        iconSize: 30,
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeIn,
          );
        }, // new
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
            icon: new Icon(Icons.language),
            title: new Text('World'),
            activeColor: Colors.indigoAccent,
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: new Icon(Icons.insert_chart),
            title: new Text('Detail'),
            activeColor: Colors.teal,
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: new Icon(Icons.lightbulb_outline),
            title: new Text('More'),
            activeColor: Colors.blue[700],
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
        ] )
    ) );
  }
}