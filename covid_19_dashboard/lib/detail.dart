import 'package:flutter/material.dart';
import 'calendar_select.dart';
import 'chart_self.dart';

class Countrydata extends StatefulWidget{
  var value;
  var info;
  List countries;
  Map map;
  Map mymap;
  Map date;
  Countrydata({@required this.value, this.info, this.countries, this.map, this.mymap, this.date});

  @override
  _CountrydataState createState() => _CountrydataState();
}

class _CountrydataState extends State<Countrydata> {
  String val = 'Vietnam';
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding : EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: DropdownButton<String>(
                    value: val,
                    icon: Icon(Icons.arrow_downward),
                    items: widget.countries.map<DropdownMenuItem<String>>((e){
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                      );
                    }).toList(),
                    onChanged: (String e) {
                      setState(() {
                        val = e;
                        
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              Container(
                padding : EdgeInsets.fromLTRB(30, 30, 30, 20),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Text(widget.map[val].country,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 60,
                      child:ClipRRect(
                        child : Image(
                          fit: BoxFit.cover,
                        image: NetworkImage(widget.mymap[val].toString()),
                      ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      ),
                  ]
                    )),
              Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Cases", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue, ),),
                                  Text(widget.map[val].cases.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),

                        Card(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Deaths", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                  Text(widget.map[val].deaths.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),

                        Card(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Recovered", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),),
                                  Text(widget.map[val].recovered.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),

                        Card(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Active", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),),
                                  Text(widget.map[val].active.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
              Calender(country: val, date: widget.date),
              Chart(country: val, date: widget.date),
                  ],
                )
              ),
        
                   
            ],
    ));
  }
}