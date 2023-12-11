import 'package:flutter/material.dart';
import 'viewcategory.dart';
import 'users.dart';
import 'view complaint.dart';
import 'viewfeedback.dart';
import 'login.dart';

void main(){
  runApp(MaterialApp(
    home: homeadmin(),
    routes: {
      '/viewcategory':(BuildContext context)=>viewcategory(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


class homeadmin extends StatefulWidget {
  @override
  State<homeadmin> createState() => _homeadminState();
}

class _homeadminState extends State<homeadmin> {
  String name = "Reema";
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
            child: Text(name.substring(0,1), style: TextStyle(color: Colors.black),),

          ),accountName: Text(name), accountEmail: Text("reema@gmail.com")),
          ListTile(
            leading: new Icon(Icons.category, color: Colors.cyan,),
            title: Text("CATEGORY"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcategory()));
            },

          ),
          ListTile(
            leading: new Icon(Icons.people, color: Colors.cyan,),
            title: Text("REGISTERED USERS"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>users()));
            },
          ),
          ListTile(
            leading: new Icon(Icons.feed_outlined, color: Colors.cyan,),
            title: Text("COMPLAINT MANAGEMENT"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcomplaint()));
            },
          ),
          ListTile(
            leading: new Icon(Icons.feedback, color: Colors.cyan,),
            title: Text("VIEW FEEDBACK"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewfeedback()));
            },
          ),
          ListTile(
            leading: new Icon(Icons.logout, color: Colors.cyan,),
            title: Text("LOGOUT"),
            onTap: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context)=>loginclass()));
            },
          )
        ],
      ),)
    );
  }
}
