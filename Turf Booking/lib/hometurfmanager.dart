import 'package:flutter/material.dart';
import 'package:turfbooking/turfviewbookings.dart';
import 'package:turfbooking/turfviewprofile.dart';
import 'login.dart';

void main(){
  runApp(MaterialApp(
    home: hometurfmanager(),
    debugShowCheckedModeBanner: false,
  ));
}


class hometurfmanager extends StatefulWidget {
  @override
  State<hometurfmanager> createState() => _hometurfmanagerState();
}

class _hometurfmanagerState extends State<hometurfmanager> {
  String admin = "Turf Manager";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(admin.substring(0,1), style: TextStyle(color: Colors.black),),

                  ),accountName: Text(admin), accountEmail: Text("turfmanager@gmail.com")),
              ListTile(
                title: Text("VIEW PROFILE"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>turfviewprofile()));
                },

              ),
              ListTile(
                title: Text("TURF MANAGEMENT"),
                onTap: (){

                },

              ),
              ListTile(
                title: Text("TIME SLOT MANAGEMENT"),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("VIEW BOOKING"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>turfviewbookings()));
                },
              ),
              ListTile(
                title: Text("LOGOUT"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                },
              )
            ],
          ),)
    );
  }
}
