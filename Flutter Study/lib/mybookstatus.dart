import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/model/model_book.dart';
import 'package:sqllitebookmate/model/model_requests.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:sqllitebookmate/services/requestsservice.dart';


void main(){
  runApp(MaterialApp(
    home: mybooksstatus(),
    debugShowCheckedModeBanner: false,
  ));
}

class mybooksstatus extends StatefulWidget {
  @override
  State<mybooksstatus> createState() => _mybooksstatusState();
}

class _mybooksstatusState extends State<mybooksstatus> {

  final blist = bookservice();
  final reqlist = requestsservice();
  List <Map<String, dynamic>> bookname = [];

  allbooks() async {
    // var c = await blist.readAllBook();
    SharedPreferences sh = await SharedPreferences.getInstance();
   var lid= await sh.getString("lid");
    var reqobj= await reqlist.rawqueryrequest(" select book.id as bid,bookname,fname,lname,image, phone, author, price, reqstatus, reqdate, requests.id as rid, catname, user.id as uid   from book,category,requests, user where  book.user= $lid and book.category=category.id and book.id = requests.book and requests.user = user.id");

    reqobj.forEach((robj) async {
      setState(() {

          bookname.add({
            'id': robj['rid'],
            'bookname': robj['bookname'],
            'username': robj["fname"]+" "+robj["lname"],
            'image': robj['image'],
            'phone': robj["phone"],
            'author': robj['author'],
            'price': robj['price'],
            'reqdate' : robj["reqdate"],
            'request_id': robj["rid"],
            'reqstatus': robj["reqstatus"],
            'category': robj["catname"],
            'book' : robj["bid"],
            'user' : robj["uid"]
          });




      });

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body:FutureBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if(bookname == null){
    return Container(
    child: Text("No data"),
    );
    }
    else {
      return ListView.builder(
          itemCount: bookname.length,
          itemBuilder: (context, index) {
            final dl = bookname[index];
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
                        child: Text("Customer name"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["username"]),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Phone Number"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["phone"]),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Book name"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["bookname"]),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Category"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["category"]),)
                    ],
                  ),

              Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Price"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["price"]),)
                    ],
                  ),

                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Author"),),
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(dl["author"]),)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                      child: Visibility(
                        visible: dl["reqstatus"] == 'pending'? true:false,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.black),
                            onPressed: () async {
                              SharedPreferences sh = await SharedPreferences.getInstance();
                              var lid = await sh.getString("lid");
                              print(dl["id"]);
                              var model_requests = requests();
                              model_requests.id = int.parse(dl["id"].toString());
                              model_requests.reqstatus = 'delivered';
                              model_requests.reqdate = dl["reqdate"];
                              model_requests.user = int.parse(dl["user"].toString());
                              model_requests.book = int.parse(dl["book"].toString());
                              var rs =requestsservice();
                              var rs1 = await rs.UpdateRequest(model_requests);

                              var model_book = book();
                              model_book.id = int.parse(dl["id"].toString());
                              model_book.bookname=dl["bookname"];
                              model_book.image=dl["image"];
                              model_book.author=dl["author"];
                              model_book.price=dl["price"];
                              model_book.bookstatus='delivered';
                              model_book.category=dl["category"];
                              model_requests.user = int.parse(dl["user"].toString());
                              var bs = bookservice();
                              var bs1 = await bs.UpdateBook(model_book);

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>mybooksstatus()));
                        }, child: Text("Set as Delivered"))))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                      child: Visibility(
                          visible: dl["reqstatus"] == 'pending' ? false:true,
                          child: Text("Delivered")),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(""),),

                    ],
                  ),Row(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                        child: Text(""),),

                    ],
                  ),

                ]);
          });
    }
    })
    );
  }

}
