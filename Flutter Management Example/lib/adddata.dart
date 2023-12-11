import 'package:flutter/material.dart';
import 'package:sqlflutter2/model/model_category.dart';
import 'package:sqlflutter2/services/categoryservice.dart';
import 'package:sqlflutter2/viewdata.dart';

void main(){
  runApp(MaterialApp(
    home: adddata(),
    debugShowCheckedModeBanner: false,
  ));
}


class adddata extends StatefulWidget {
  @override
  State<adddata> createState() => _adddataState();
}

class _adddataState extends State<adddata> {
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 200, left: 20, right: 20),
          child: TextField(
            controller: a,
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.all(20),
          child: ElevatedButton(onPressed: () async {
            var model_category= category();
            model_category.name= a.text;
            var cs = categoryservice();
            var result= await cs.SaveCategory(model_category);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata()));
          }, child: Text("Submit")),)
        ],
      ),
    );
  }
}
