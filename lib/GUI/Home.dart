import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  void onPressBTn() async{
    Map myInfo = await getMyData();
    print(myInfo);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Muhammed Essa") ,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.home),
              onPressed: onPressBTn
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new  Center(
            child: new Image.asset('images/sky.jpg',
             height: 1000.0,
             width: 1500.0,
             fit: BoxFit.fill,
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 44.0 ),
            padding: EdgeInsets.only(top: 66.0),
            child: new Text('Paris',
              style: TextStyle(
                color:Colors.deepPurple,
                fontSize: 44.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ) ,),

          ),

          new Container(
            margin: EdgeInsets.only(left: 174.0 ),
            padding: EdgeInsets.only(top: 66.0),
            child: new Image.asset(
              'images/rain.png',

            ),

          ),

    new Container(
    margin: EdgeInsets.only(left: 34.0 ),
        padding: EdgeInsets.only(top: 166.0),
   // alignment: Alignment.center,
    child:  widgetMyData(),
    )
        ],
      ),
    );
  }


  Future<Map> getMyData() async{
    String myUrl = 'https://api.apixu.com/v1/current.json?key=d5353fd191894297a7d183708180210&q=Paris';
  http.Response response = await http.get(myUrl);
  return json.decode(response.body);
  }

  Widget widgetMyData(){
    return new FutureBuilder(
      future: getMyData(),
        builder: (BuildContext context , AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content = snapshot.data;
          return new Container(
            child: new ListTile(
              subtitle:new Text(content['current']['temp_f'].toString(),
                style: TextStyle(
                  color:Colors.pink,
                  fontSize: 77.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ) ,) ,
              title:  new Text(content['current']['temp_c'].toString(),
              style: TextStyle(
                color:Colors.pink,
                fontSize: 77.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ) ,)
            ),
          );
        }else{
          return new Container(

          );
        }

        });
  }

}