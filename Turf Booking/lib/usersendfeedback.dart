import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turfbooking/homeuser.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: usersendfeedback(),
    debugShowCheckedModeBanner: false,
  ));
}


class usersendfeedback extends StatefulWidget {
  @override
  State<usersendfeedback> createState() => _usersendfeedbackState();
}

class _usersendfeedbackState extends State<usersendfeedback> {
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
                onPressed: (){
                  send(fdback.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homeuser()));
                }, child: Text("SEND")),)
        ],
      ),
    );
  }
  Future<void> send(String fdback) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String lid = sf.getString("lid").toString();
    var cmp= await http.post(Uri.parse(sf.getString("url").toString()+"/sendfeedback"),
        body: {'feedback': fdback.toString(), 'lid':lid});
  }

}
