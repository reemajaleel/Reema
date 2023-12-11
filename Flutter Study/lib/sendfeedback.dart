import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/homeuser.dart';
import 'package:flutter/material.dart';
import 'package:sqllitebookmate/model/model_feedback.dart';
import 'package:sqllitebookmate/services/feedbackservice.dart';


void main() {
  runApp(MaterialApp(
    home: sendfeedback(),
    debugShowCheckedModeBanner: false,
  ));
}


class sendfeedback extends StatefulWidget {
    @override
  State<sendfeedback> createState() => _sendfeedbackState();
}

class _sendfeedbackState extends State<sendfeedback> {
  TextEditingController fdback = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: fdback,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                hintText: "Enter Feedback",
                border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.all(20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () async {
              SharedPreferences sh = await SharedPreferences.getInstance();
              var uid = sh.getString("lid");
              var model_feedback = feedbacks();
              model_feedback.feedback=fdback.text;
              model_feedback.feedbackdate=DateTime.now().toString();
              model_feedback.user=int.parse(uid.toString());
              var fs = feedbacksservice();
              var fs1 = await fs.SaveFeedback(model_feedback);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>homeuser()));
          }, child: Text("SEND")),)
        ],
      ),
    );
  }
}
