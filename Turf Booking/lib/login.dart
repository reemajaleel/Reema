import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turfbooking/homeadmin.dart';
import 'package:turfbooking/hometurfmanager.dart';
import 'package:turfbooking/homeuser.dart';
import 'package:turfbooking/regturfmanager.dart';
import 'package:turfbooking/reguser.dart';

void main() {
  runApp(MaterialApp(
    home: login(),
    debugShowCheckedModeBanner: false,
  ));
}

class login extends StatefulWidget {
  @override
  login1 createState() => login1();
}

class login1 extends State<login> {
  TextEditingController username= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Username: ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: username,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Username",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Password: ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        submit(username.text,password.text);

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20, left: 250),
                          child:GestureDetector(
                            child: Text("Turf Manager sign up?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>regturfmanager()));
                            },
                          ),),
                        Padding(padding: EdgeInsets.only(top: 20, left: 250),
                          child:GestureDetector(
                            child: Text("User sign up?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>reguser()));
                            },
                          ),)
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit(String username, String password) async {
    SharedPreferences a =  await SharedPreferences.getInstance();
    var sub= await http.post(Uri.parse(a.getString("url").toString()+"/loginpage"), body: {"username":username.toString(), "password":password.toString()});
    var res =jsonDecode(sub.body);
    if(res['status'] == "ok") {
      String userid= res['id'].toString();
      String name= res['name'].toString();
      String email= res['email'].toString();

      a.setString("lid", userid);
      a.setString("name", name);
      a.setString("email", email);

      if (res['type'] == "admin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homeadmin()));
      }
      else if(res['type'] == "user"){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homeuser()));
      }
      else if(res['type'] == "turfmanager"){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => hometurfmanager()));
      }

    }
    else{
      Fluttertoast.showToast(
          msg: "Unknown User",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER
      );
    }

  }
}
