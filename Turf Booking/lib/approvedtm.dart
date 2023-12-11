import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  runApp(MaterialApp(
    home: approvedtm(),
    debugShowCheckedModeBanner: false,
  ));
}

class tmdemo {
  final String id;
  final String mname;
  final String mdob;
  final String memail;
  final String mph;

  tmdemo({
    required this.id,
    required this.mname,
    required this.mdob,
    required this.memail,
    required this.mph,

  });

}



class approvedtm extends StatefulWidget {
  @override
  State<approvedtm> createState() => _approvedtmState();
}

class _approvedtmState extends State<approvedtm> {
  List <tmdemo> demolist = [];
  Future<List<tmdemo>> viewuser() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var dt = await http.post(Uri.parse(a.getString("url").toString()+"/datauser"));
    var Jsondata = json.decode(dt.body);

    for (var i in Jsondata['userdata']) {
      tmdemo ob = tmdemo(id: i['id'].toString(), mname: i['mname'].toString(),mdob: i['mdob'].toString(),memail: i['memail'].toString(),mph: i['mph'].toString());
      demolist.add(ob);
    }
    return demolist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(

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
                                    child: Text("Name: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.mname),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Date of Birth: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.mdob),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Email: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.memail),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Phone: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.mph),)
                                ],
                              ),
                            ]
                        );
                      });
                }
              })),
    );
  }
}
