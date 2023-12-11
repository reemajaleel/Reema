import 'package:flutter/material.dart';
import 'package:turfbooking/previousbookings.dart';
import 'package:turfbooking/turfviewprofile.dart';
import 'package:turfbooking/usersendfeedback.dart';
import 'package:turfbooking/userviewfeedback.dart';
import 'package:turfbooking/userviewprofile.dart';
import 'package:turfbooking/viewturf.dart';
import 'login.dart';

void main(){
  runApp(MaterialApp(
    home: homeuser(),
    debugShowCheckedModeBanner: false,
  ));
}


class homeuser extends StatefulWidget {
  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {
  String admin = "User";
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

                  ),accountName: Text(admin), accountEmail: Text("user@gmail.com")),
              ListTile(
                title: Text("VIEW PROFILE"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>userviewprofile()));
                },

              ),ListTile(
                title: Text("VIEW TURFS"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewturf()));
                },

              ),ListTile(
                title: Text("VIEW PREVIOUS BOOKINGS"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>previousbookings()));
                },

              ),
              ListTile(
                title: Text("SEND FEEDBACK"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>usersendfeedback()));
                },

              ),
              ListTile(
                title: Text("VIEW FEEDBACK"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>userviewfeedback()));
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
