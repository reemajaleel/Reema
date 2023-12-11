import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


void main() {
  runApp(MaterialApp(
    home: regturfmanager(),
    debugShowCheckedModeBanner: false,
  ));
}



class regturfmanager extends StatefulWidget {
  @override
  _regturfmanagerState createState() => _regturfmanagerState();
}

class _regturfmanagerState extends State<regturfmanager> {
  TextEditingController mname = TextEditingController();
  TextEditingController mdob = TextEditingController();
  TextEditingController memail = TextEditingController();
  TextEditingController mph = TextEditingController();
  TextEditingController mpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: mname,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: "Enter Name",
                  labelText: "Enter Name"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: mdob,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_month),
                  hintText: "Enter Date of Birth",
                  labelText: "Enter Date of Birth"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: memail,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  hintText: "Enter Email",
                  labelText: "Enter Email"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: mph,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                icon: Icon(Icons.phone),
                hintText: "Enter Phone Number",
                labelText: "Enter Phone Number",
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: mpassword,
              obscureText: true,
              obscuringCharacter:'*' ,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  hintText: "Enter Password",
                  labelText: "Enter Password"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                primary: Colors.black
            ),
              onPressed: (){
                submit(mname.text, mdob.text, memail.text, mph.text, mpassword.text);

              },
              child: Text("Submit", style: TextStyle(color: Colors.white),),
            ),)
        ],
      ),
    );
  }

  Future<void> submit(String mname, String mdob, String memail, String mph, String mpassword) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var sub= await http.post(Uri.parse(a.getString("url").toString()+"/tmadd"),
        body: {'mname':mname.toString(), 'mdob':mdob.toString(), 'memail':memail.toString(), 'mph':mph.toString(),'mpassword':mpassword.toString()});
    var res=jsonDecode(sub.body);
    if( res['status']=='ok'){
      Navigator.pop(context, MaterialPageRoute(builder: (context)=>login()));
    }
    else{
      Fluttertoast.showToast(
          msg: "User already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
    }
  }
}
