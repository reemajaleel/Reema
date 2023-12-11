import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(MaterialApp(
    home: userviewprofile(),
    debugShowCheckedModeBanner: false,
  ));
}

class userviewprofile extends StatefulWidget {
  @override
  State<userviewprofile> createState() => _userviewprofileState();
}

class _userviewprofileState extends State<userviewprofile> {
  String id ="";
  String uname ="";
  String udob ="";
  String uemail ="";
  String uphone ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewprofile();
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
    child: Text(uname),)
    ],
    ),Row(
    children: [
    Padding(padding: EdgeInsets.all(20),
    child: Text("Date of Birth: "),),
    Padding(padding: EdgeInsets.all(20),
    child: Text(udob),)
    ],
    ),Row(
    children: [
    Padding(padding: EdgeInsets.all(20),
    child: Text("Email: "),),
    Padding(padding: EdgeInsets.all(20),
    child: Text(uemail),)
    ],
    ),Row(
    children: [
    Padding(padding: EdgeInsets.all(20),
    child: Text("Phone: "),),
    Padding(padding: EdgeInsets.all(20),
    child: Text(uphone),)
    ],
    )
    ]
    )
    ));
  }
  viewprofile() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var dt = await http.post(Uri.parse(a.getString("url").toString()+"/viewuserprofile"),
        body: {'id': a.getString("lid").toString()});
    print(dt);
    var Jsondata = json.decode(dt.body);

    print(Jsondata['data']);
    setState(() {
      id = Jsondata['data']['id'].toString();
      uname= Jsondata['data']['uname'].toString();
      udob= Jsondata['data']['udob'].toString();
      uemail= Jsondata['data']['uemail'].toString();
      uphone= Jsondata['data']['uphone'].toString();
    });


  }
}
