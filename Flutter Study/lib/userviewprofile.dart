import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: userviewprofile(),
    debugShowCheckedModeBanner: false,
  ));
}


class userviewprofile extends StatefulWidget {
  @override
  State<userviewprofile> createState() => _userviewprofileState();
}

class _userviewprofileState extends State<userviewprofile> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      // appBar: AppBar(
      //   title: Text("View Profile"),
      //   centerTitle: true,
      // ),
      body: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("First Name: "),
                ),
                SizedBox(width: 50,),
                Expanded(child: Text("fname")
                )
              ],
            ),Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Last Name: "),
                ),
                SizedBox(width: 50,),
                Expanded(child: Text("lname")
                )
              ],
            ),
            Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Date of Birth: "),
                ),
                SizedBox(width: 40,),
                Expanded(child: Text("dob")
                )],
            ),
            Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Email: "),
                ),
                SizedBox(width: 80,),
                Expanded(child: Text("email")
                )
              ],
            ),Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Phone Number: "),
                ),
                SizedBox(width: 25,),
                Expanded(child: Text("phone")
                )
              ],
            )
          ])
      );
    }
}
