import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(MaterialApp(
    home: viewusers(),
    debugShowCheckedModeBanner: false,
  ));
}

class userdemo {
  final String id;
  final String uname;
  final String udob;
  final String uemail;
  final String uph;

  userdemo({
    required this.id,
    required this.uname,
    required this.udob,
    required this.uemail,
    required this.uph,

  });

}



class viewusers extends StatefulWidget {
  @override
  State<viewusers> createState() => _viewusersState();
}

class _viewusersState extends State<viewusers> {
  List <userdemo> demolist = [];
  Future<List<userdemo>> viewuser() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var dt = await http.post(Uri.parse(a.getString("url").toString()+"/datauser"));
    var Jsondata = json.decode(dt.body);

    for (var i in Jsondata['userdata']) {
      userdemo ob = userdemo(id: i['id'].toString(), uname: i['uname'].toString(),udob: i['udob'].toString(),uemail: i['uemail'].toString(),uph: i['uph'].toString());
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
                                    child: Text(dl.uname),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Date of Birth: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.udob),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Email: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.uemail),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Phone: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl.uph),)
                                ],
                              )
                            ]
                        );
                      });
                }
              })),
    );
  }
}
