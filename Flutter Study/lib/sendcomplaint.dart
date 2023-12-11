import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/homeuser.dart';
import 'package:sqllitebookmate/model/model_complaint.dart';
import 'package:sqllitebookmate/services/complaintservice.dart';
import 'package:sqllitebookmate/viewreply.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(MaterialApp(
    home: sendcomplaint(),
    debugShowCheckedModeBanner: false,
  ));
}


class sendcomplaint extends StatefulWidget {
  @override
  _sendcomplaintState createState() => _sendcomplaintState();
}

class _sendcomplaintState extends State<sendcomplaint> {
  TextEditingController sendcomplaint1 = TextEditingController();
  bool screq=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: Text("Enter Complaint: "),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: sendcomplaint1,
              decoration: InputDecoration(
                errorText: screq? "Required" : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder()
              ),
            )),
          Align(
            alignment: Alignment.center,
              child: Padding(padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () async {

                      sendcomplaint1.text.isEmpty? screq = true :screq = false;
                      if(screq==false){
                        SharedPreferences sh = await SharedPreferences.getInstance();
                        var uid = sh.getString("lid");
                        var model_complaint = complaints();
                        model_complaint.complaint = sendcomplaint1.text;
                        model_complaint.comdate = DateFormat('yyyy-MM-dd').format(DateTime.now());;
                        model_complaint.comstatus = 'pending';
                        model_complaint.reply = 'pending';
                        model_complaint.user = int.parse(uid.toString());
                        var cs = complaintsservice();
                        var cs1 = await cs.SaveComplaint(model_complaint);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>homeuser()));
                      }


                // Navigator.push(context, MaterialPageRoute(builder: (context)=>viewreply()));
              }, child: Text("SEND")),)
          )
        ],
      ),
    );
  }
}
