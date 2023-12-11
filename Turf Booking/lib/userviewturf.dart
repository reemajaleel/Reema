import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: userviewturf(),
    debugShowCheckedModeBanner: false,
  ));
}



class demo {
  final String id;
  final String catname;

  demo({
    required this.id,
    required this.catname,

  });

}
class userviewturf extends StatefulWidget {
  @override
  State<userviewturf> createState() => userviewturf1();
}

class userviewturf1 extends State<userviewturf> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(

              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.data == null){
                  return Container(
                    child: Text("No data"),
                  );
                }
                else{
                  return ListView.builder(

                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final dl = snapshot.data[index];
                        index=index+1;
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Sl no: "),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(child: Text(index.toString())
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Turf Name: "),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(child: Text("")
                                  )
                                ],
                              ),

                            ],
                          ),
                        );
                      }
                  );
                }


              })

      ),
    );
  }


}