import 'package:flutter/material.dart';
import 'package:turfbooking/adminviewfeedback.dart';
import 'package:turfbooking/approvedtm.dart';
import 'package:turfbooking/viewturf.dart';
import 'package:turfbooking/viewusers.dart';

import 'login.dart';

void main(){
  runApp(MaterialApp(
    home: homeadmin(),
    debugShowCheckedModeBanner: false,
  ));
}


class homeadmin extends StatefulWidget {
  @override
  State<homeadmin> createState() => _homeadminState();
}

class _homeadminState extends State<homeadmin> {
  String admin = "Admin";
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

                  ),accountName: Text(admin), accountEmail: Text("admin@gmail.com")),

              ListTile(
                title: Text("VIEW TURF MANAGERS"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>approvedtm()));
                },

              ),
              ListTile(
                title: Text("REGISTERED USERS"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewusers()));
                },
              ),
              ListTile(
                title: Text("VIEW TURFS"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewturf()));
                },
              ),
              ListTile(
                title: Text("VIEW FEEDBACK"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>adminviewfeedback()));
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
