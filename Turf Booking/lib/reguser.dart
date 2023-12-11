import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


void main() {
  runApp(MaterialApp(
    home: reguser(),
    debugShowCheckedModeBanner: false,
  ));
}



class reguser extends StatefulWidget {
  @override
  _reguserState createState() => _reguserState();
}

class _reguserState extends State<reguser> {
  TextEditingController uname = TextEditingController();
  TextEditingController udob = TextEditingController();
  TextEditingController uemail = TextEditingController();
  TextEditingController uph = TextEditingController();
  TextEditingController upassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: uname,
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
              controller: udob,
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
              controller: uemail,
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
              controller: uph,
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
              controller: upassword,
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
                submit(uname.text, udob.text, uemail.text, uph.text, upassword.text);

              },
              child: Text("Submit", style: TextStyle(color: Colors.white),),
            ),)
        ],
      ),
    );
  }

  Future<void> submit(String uname, String udob, String uemail, String uph, String upassword) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var sub= await http.post(Uri.parse(a.getString("url").toString()+"/useradd"),
        body: {'uname':uname.toString(), 'udob':udob.toString(), 'uemail':uemail.toString(), 'uph':uph.toString(),'upassword':upassword.toString()});
    var res=jsonDecode(sub.body);
    print(res);
    if( res['status']=='ok'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
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
