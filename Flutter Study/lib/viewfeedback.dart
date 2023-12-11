import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/model/model_feedback.dart';
import 'package:sqllitebookmate/services/feedbackservice.dart';

void main() {
  runApp(MaterialApp(
    home: viewfeedback(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>
      {
        '/viewfdb':(BuildContext context)=>new viewfeedback()
    }
  ));
}



class viewfeedback extends StatefulWidget {
    @override
  State<viewfeedback> createState() => viewfeedback1();
}

class viewfeedback1 extends State<viewfeedback> {
  final flist = feedbacksservice();
  List <Map<String, dynamic>> msg =[];

  allmsg() async {
    var f = await flist.readAllFeedback();
    SharedPreferences sh = await SharedPreferences.getInstance();
    f.forEach((fobj) async {
      var uobj = await flist.rawqueryfeedback("select * from user where id = ${fobj['user']}");
      setState(() {
        msg.add({
          'id': fobj['id'],
          'feedback': fobj['feedback'],
          'feedbackdate': fobj['feedbackdate'],
          'user': fobj['user'],
          'name': uobj[0]['fname'].toString()+" "+uobj[0]['lname'].toString()
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allmsg();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (msg==null){
                  return Container(
                    child: Text("No Feedback"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: msg.length,
                      itemBuilder: (context, index) {
                        final dl = msg[index];
                        index=index+1;
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Sl no: "),
                                ),
                                SizedBox(width: 50,),
                                Expanded(child: Text(index.toString())
                                )
                              ],
                            ),Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Name: "),
                                ),
                                SizedBox(width: 45,),
                                Expanded(child: Text(dl["name"])
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Date: "),
                                ),
                                SizedBox(width: 55,),
                                Expanded(child: Text(dl["feedbackdate"])
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Feedback: "),
                                ),
                                SizedBox(width: 25,),
                                Expanded(child: Text(dl["feedback"])
                                )
                              ],
                            ),
                            Divider(
                              height: 100,
                              color: Colors.black,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            )
                          ],
                        );
                      }
                  );
                }
          })

      ),
    );
  }
}
