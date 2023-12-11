import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sqllitebookmate/services/complaintservice.dart';

void main(){
  runApp(MaterialApp(
    home: viewreply(),
    debugShowCheckedModeBanner: false,
  ));
}


class viewreply extends StatefulWidget {
  @override
  State<viewreply> createState() => _viewreplyState();
}

class _viewreplyState extends State<viewreply> {
  final crlist = complaintsservice();
  List <Map<String, dynamic>> r = [];

  replies() async {
    var rq1 = await crlist.readAllComplaint();
    SharedPreferences sh = await SharedPreferences.getInstance();
    rq1.forEach((robj) async {

      setState((){
        if(sh.getString("lid").toString() == robj['user'].toString()) {
          r.add({
            'id': robj['id'].toString(),
            'complaint': robj['complaint'].toString(),
            'comdate' : robj['comdate'].toString(),
            'comstatus' : robj['comstatus'].toString(),
            'reply' : robj['reply'].toString(),
            'user' : robj["user"].toString(),
          });
        }

      });

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    replies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (r == null) {
                  return Container(
                    child: Text("No data"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: r.length,
                      itemBuilder: (context, index) {
                        final dl = r[index];
                        index = index + 1;
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Sl no: "),
                                ),
                                SizedBox(width: 55,),
                                Expanded(child: Text(index.toString())
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
                                Expanded(child: Text(dl['comdate'])
                                )
                              ],
                            ), Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Complaint: "),
                                ),
                                SizedBox(width: 20,),
                                Expanded(child: Text(dl['complaint'])
                                )
                              ],
                            ), Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Reply: "),
                                ),
                                SizedBox(width: 50,),
                                Expanded(child: Text(dl['reply'])
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
              }
          )),
    );
  }
}
