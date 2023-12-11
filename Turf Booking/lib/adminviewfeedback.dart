import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  runApp(MaterialApp(
    home: adminviewfeedback(),
    debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>
      {
        '/viewfdb':(BuildContext context)=>new adminviewfeedback()
      }
  ));
}


class feedbackdemo{
  String id;
  String uname;
  String feedback;
  String feedbackdate;

  feedbackdemo({
    required this.id,
    required this.uname,
    required this.feedback,
    required this.feedbackdate,
  });

}

class adminviewfeedback extends StatefulWidget {
  @override
  State<adminviewfeedback> createState() => _adminviewfeedbackState();
}

class _adminviewfeedbackState extends State<adminviewfeedback> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(
              future: viewfdb(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.data == null) {
                  return Container(
                    child: Text("No data"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final dl = snapshot.data[index];
                        index = index + 1;
                        return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Sl no: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(index.toString()),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Date: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.feedbackdate),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Name: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.uname),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Feedback: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.feedback),)
                                ],
                              ),
                              Divider(
                                height: 100,
                                color: Colors.black,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              )
                            ]
                        );
                      });
                }
              })),
    );
  }
  Future<List<feedbackdemo>>viewfdb() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var dt= await http.post(Uri.parse(a.getString("url").toString()+"/viewfeedback"));
    var Jsondata= json.decode(dt.body);
    List<feedbackdemo> demolist=[];
    for(var i in Jsondata['data']){
      feedbackdemo ob = feedbackdemo(id: i['id'].toString(), uname: i['uname'].toString(), feedback: i['feedback'].toString(), feedbackdate: i['feedbackdate'].toString());
      demolist.add(ob);
    }
    return demolist;
  }
}
