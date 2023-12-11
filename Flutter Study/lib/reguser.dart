import 'dart:convert';

import 'package:sqllitebookmate/login.dart';
import 'package:flutter/material.dart';
import 'package:sqllitebookmate/model/model_login.dart';
import 'package:sqllitebookmate/model/model_user.dart';
import 'package:sqllitebookmate/services/loginservice.dart';
import 'package:sqllitebookmate/services/userservice.dart';



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
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController password = TextEditingController();
  bool freq= false, lreq = false, dreq= false, ereq=false, phreq=false, passreq=false;
  String phmsg="";
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  String emsg="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: fname,
              decoration: InputDecoration(
                filled: true,
                  fillColor: Colors.white,
                  errorText: freq ? "Required" : null,
                  border: OutlineInputBorder(
                  ),
                  icon: Icon(Icons.person),
                  hintText: "Enter First Name",
                  labelText: "Enter First Name",labelStyle: TextStyle(color: Colors.black)
              ),
            ),),Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: lname,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorText: lreq ? "Required" : null,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: "Enter Last Name",
                  labelText: "Enter Last Name"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              onTap: (){
                showDatePicker(
                    context: context,
                    initialDate: DateTime(1950,1),
                    firstDate: DateTime(1950,1),
                    lastDate: DateTime(2010,12),
                ).then((value) => dob.text = value.toString() );
              },
              controller: dob,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorText: dreq ? "Required" : null,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_month),
                  hintText: "Choose Date of Birth",
                  labelText: "Choose Date of Birth"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorText: ereq ? emsg : emsg,
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  hintText: "Enter Email",
                  labelText: "Enter Email"
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: ph,
              decoration: InputDecoration(
                filled: true,

                fillColor: Colors.white,
                errorText: phreq ? phmsg : phmsg,
                border: OutlineInputBorder(),
                icon: Icon(Icons.phone),
                prefixText: "+91",
                hintText: "Enter Phone Number",
                labelText: "Enter Phone Number",
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: password,
              obscureText: true,
              obscuringCharacter:'*' ,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorText: passreq ? "Required" : null,
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
              onPressed: () async {
              setState(() {
                fname.text.isEmpty? freq = true : freq = false;
                lname.text.isEmpty? lreq = true : lreq = false;
                dob.text.isEmpty? dreq = true : dreq = false;
                // email.text.isEmpty? ereq = true : ereq = false;
                if (email.text.isEmpty) {
                  ereq = true;
                  emsg = "Required";
                } else if (!email.text.endsWith("@gmail.com")) {
                  ereq = true;
                  emsg = "Format should end with @gmail.com. Eg: username@gmail.com";
                } else {
                  ereq = false;
                  emsg = "";
                }
                // ph.text.isEmpty? phreq = true : phreq = false;
                if(ph.text.isEmpty){
                  phreq = true;
                  phmsg = "Required";
                }
                else{
                  if(ph.text.length != 10) {
                    phreq = true;
                    phmsg = "Phone number should be 10 digits";
                  }
                  else{


                    if(ph.text.isNotEmpty && !['6','7','8','9'].contains(ph.text[0])){
                      phreq = true;
                      phmsg = "Phone number must start with 6, 7, 8, or 9";
                    }
                    else{

                      phreq = false;
                      phmsg = "";
                    }
                  }
                }
                password.text.isEmpty? passreq = true : passreq = false;


              });

              if(freq==false && lreq==false && dreq==false && ereq==false && phreq==false && passreq==false){

                var model_login=login();
                model_login.username=email.text;
                model_login.password=password.text;
                model_login.type='user';
                var ls = loginservice();
                var lresult = await ls.SaveLogin(model_login);


                var model_user= user();
                model_user.fname=fname.text;
                model_user.lname=lname.text;
                model_user.dob=dob.text;
                model_user.email=email.text;
                model_user.phone=ph.text;
                model_user.login=lresult;
                var us = userservice();
                var uresult = await us.SaveUser(model_user);
                print("ok");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>loginclass()));
              }
              },
              child: Text("Submit", style: TextStyle(color: Colors.white),),
            ),)
        ],
      ),
    );
  }


}
