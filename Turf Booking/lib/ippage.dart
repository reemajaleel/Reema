import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turfbooking/login.dart';

void main(){
  runApp(MaterialApp(
    home: ippage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ippage extends StatefulWidget {
  @override
  State<ippage> createState() => _ippageState();
}

class _ippageState extends State<ippage> {
  TextEditingController ippage1 = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      ippage1.text = "192.168.1.7".toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: ippage1,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                primary: Colors.black
            ),
                onPressed: () async {
                  SharedPreferences ip1= await SharedPreferences.getInstance();
                  ip1.setString("ip", ippage1.text);
                  ip1.setString("url", "http://"+ippage1.text+":8000");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                }, child: Text("Save IP", style: TextStyle(color: Colors.white),)),)
        ],
      ),
    );
  }
}
