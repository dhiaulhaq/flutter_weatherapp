import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/screens/detail_bandung.dart';
import 'package:flutter_weatherapp/screens/detail_jakarta.dart';
import 'package:flutter_weatherapp/screens/detail_tangerang.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Weather App",
    home: Home(),
  ),
);

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState () {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{

  var temp_jkt;
  var temp_tgr;
  var temp_bnd;

  Future getJakarta () async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Jakarta&appid=a5c4bcc4718c6fb176b74a9db136644b");
    var results = jsonDecode(response.body);
    setState((){
      this.temp_jkt = results['main']['temp'];
    });
  }

  Future getTangerang () async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Tangerang&appid=a5c4bcc4718c6fb176b74a9db136644b");
    var results = jsonDecode(response.body);
    setState((){
      this.temp_tgr = results['main']['temp'];
    });
  }

  Future getBandung () async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Bandung&appid=a5c4bcc4718c6fb176b74a9db136644b");
    var results = jsonDecode(response.body);
    setState((){
      this.temp_bnd = results['main']['temp'];
    });
  }

  @override
  void initState(){
    super.initState();
    this.getJakarta();
    this.getTangerang();
    this.getBandung();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    "Weather App",
                    style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w900),
                  ),
                  // SearchBar(),
                  SizedBox(height: 40),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Jakarta",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              temp_jkt != null ? temp_jkt.toString() + "\u00B0" : "Loading",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return DetailJakarta();
                        }),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Bandung",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              temp_bnd != null ? temp_bnd.toString() + "\u00B0" : "Loading",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return DetailBandung();
                        }),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Tangerang",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              temp_tgr != null ? temp_tgr.toString() + "\u00B0" : "Loading",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return DetailTangerang();
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
