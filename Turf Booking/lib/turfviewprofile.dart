import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(MaterialApp(
    home: turfviewprofile(),
    debugShowCheckedModeBanner: false,
  ));
}

class turfviewprofile extends StatefulWidget {
  @override
  State<turfviewprofile> createState() => _turfviewprofileState();
}

class _turfviewprofileState extends State<turfviewprofile> {
  String id ="";
  String mname ="";
  String mdob ="";
  String memail ="";
  String mphone ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tmviewprofile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Container(
            child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Name: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(mname),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Date of Birth: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(mdob),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Email: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(memail),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Phone: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(mphone),)
                    ],
                  )
                ]
            )
        ));
  }
  tmviewprofile() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var dt = await http.post(Uri.parse(a.getString("url").toString()+"/viewtmprofile"),
        body: {'id': a.getString("lid").toString()});
    print(dt);
    var Jsondata = json.decode(dt.body);

    print(Jsondata['data']);
    setState(() {
      id = Jsondata['data']['id'].toString();
      mname= Jsondata['data']['mname'].toString();
      mdob= Jsondata['data']['mdob'].toString();
      memail= Jsondata['data']['memail'].toString();
      mphone= Jsondata['data']['mphone'].toString();
    });


  }
}
