import 'package:flutter/material.dart';
import 'package:sqllitebookmate/bookstatus.dart';
import 'package:sqllitebookmate/mybookstatus.dart';
import 'package:sqllitebookmate/sendcomplaint.dart';
import 'package:sqllitebookmate/userviewprofile.dart';
import 'package:sqllitebookmate/viewbooks.dart';
import 'package:sqllitebookmate/viewreply.dart';
import 'login.dart';
import 'userviewcategory.dart';
import 'sendfeedback.dart';

// void main(){
//   runApp(MaterialApp(
//     home: homeuser(),
//     debugShowCheckedModeBanner: false,
//   ));
// }


class homeuser extends StatefulWidget {
  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {

  String name = "Reema",email="reema@gmail.com";
  // Future<void> sam() async {
   //  SharedPreferences a = await SharedPreferences.getInstance();
   // setState(() {
   //   name = a.getString("name").toString();
   //   email = a.getString("email").toString();
   // });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sam();

  }
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

            ),accountName: Text(name), accountEmail: Text(email)),
            ListTile(
              leading: new Icon(Icons.person, color: Colors.cyan,),
              title: Text("VIEW PROFILE"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>userviewprofile()));
              },

            ),ListTile(
              leading: new Icon(Icons.book, color: Colors.cyan,),
              title: Text("VIEW BOOKS"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbooks()));
              },

            ),
            ListTile(
              leading: new Icon(Icons.category, color: Colors.cyan,),
              title: Text("VIEW CATEGORIES"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>userviewcategory()));
              },
            ),
            ListTile(
              leading: new Icon(Icons.book_online, color: Colors.cyan,),
              title: Text("BOOK STATUS"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>bookstatus()));
              },
            ),ListTile(
              leading: new Icon(Icons.menu_book, color: Colors.cyan,),
              title: Text("MY BOOK STATUS"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>mybooksstatus()));
              },
            ),
            ListTile(
              leading: new Icon(Icons.feed_outlined, color: Colors.cyan,),
              title: Text("SEND COMPLAINT"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sendcomplaint()));
              },
            ),
            ListTile(
              leading: new Icon(Icons.reply, color: Colors.cyan,),
              title: Text("VIEW REPLY"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewreply()));
              },
            ),
            ListTile(
              leading: new Icon(Icons.feedback, color: Colors.cyan,),
              title: Text("SEND FEEDBACK"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sendfeedback()));
              },
            ),
            ListTile(
              leading: new Icon(Icons.logout,color: Colors.cyan,),
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
