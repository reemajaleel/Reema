import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/model/model_requests.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:sqllitebookmate/services/requestsservice.dart';



void main() {
  runApp(MaterialApp(
    home: bookstatus(),
    debugShowCheckedModeBanner: false,
  ));
}




class bookstatus extends StatefulWidget {
  @override
  State<bookstatus> createState() => _bookstatusState();
}

class _bookstatusState extends State<bookstatus> {
  // late List<requests> rq = <requests> [];
  final rlist = requestsservice();
  final bklist = bookservice();
  List <Map<String, dynamic>> datareq = [];


   allreq() async {
    var rq1 = await rlist.readAllRequest();
    SharedPreferences sh = await SharedPreferences.getInstance();
    rq1.forEach((robj) async {
      var bkobj = await bklist.rawqueryBook("select * from book,category,requests where book.category=category.id and requests.id = ${robj['id']} and requests.book = book.id");

      bkobj = bkobj[0];

      setState((){
        datareq.add({
          'id': robj['id'].toString(),
          'reqstatus': robj['reqstatus'].toString(),
          'reqdate' : robj['reqdate'].toString(),
          'user' : robj['user'].toString(),
          'bookname' : bkobj['bookname'].toString(),
          'category' : bkobj["category"].toString(),
          'price' : bkobj["price"].toString(),
          'author' : bkobj["author"].toString(),
          'image' : bkobj["image"]
        });
      });

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allreq();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
        child: FutureBuilder(
        // future: allreq(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if(datareq == null){
    return Container(
    child: Text("No data"),
    );
    }
    else {
      return ListView.builder(
          itemCount: datareq.length,
          itemBuilder: (context, index) {
            final dl = datareq[index];
            index = index + 1;
            return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Sl no: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(index.toString()),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Book Name: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["bookname"]),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Book Image: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: CircleAvatar(
            radius: 50, backgroundImage: MemoryImage(base64Decode(dl["image"])),
            )
            )]
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Book Status: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["reqstatus"]),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Request Date: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["reqdate"]),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Price: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["price"]),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Author: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["author"]),)
                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Category: "),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["category"]),)
                    ],
                  ),

                ]);
          });
    }})
    )
    );
  }


}
