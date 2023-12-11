import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqllitebookmate/model/model_category.dart';
import 'package:sqllitebookmate/model/model_requests.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:sqllitebookmate/services/requestsservice.dart';

import 'bookstatus.dart';
import 'homeuser.dart';
import 'model/model_book.dart';
import 'useraddbooks.dart';
import 'userviewcategory.dart';
import 'usereditbooks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class viewallbooks extends StatefulWidget {
  final  data;
  viewallbooks({ required this.data });
  @override
  State<viewallbooks> createState() => _viewallbooksState();
}

class _viewallbooksState extends State<viewallbooks> {
  late List<book> bk = <book> [];
  final blist = bookservice();


  Future<List<book>>  allbooks() async {
    var bk1 = await blist.readAllBook();
    bk1.forEach((bobj){
      var bookdata = book();
      bookdata.id = bobj['id'];
      bookdata.bookname = bobj['bookname'];
      bookdata.image = bobj['image'];
      bookdata.author = bobj['author'];
      bookdata.price = bobj['price'];
      bookdata.bookstatus = bobj['bookstatus'];
      bookdata.category = bobj['category'];
      if(bobj['category'] == widget.data){
        bk.add(bookdata);
      }

    });
    return bk;
    }


  //
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // allbooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
            child: FutureBuilder(
              future: allbooks(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.data == null){
                    return Container(
                      child: Text("No books"),
                    );
                  }
                  else {
                    return ListView.builder(
                        itemCount: bk.length,
                        itemBuilder: (context, index) {
                          final dl = bk[index];
                          print("hellllllllllllllllooooooooooooooooooo");
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
                                      child: Text(dl.bookname ?? ''),)
                                  ],
                                ),Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(20),
                                        child: CircleAvatar(
                                          radius: 50, backgroundImage: MemoryImage(base64Decode(dl.image ?? '')),
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(20),
                                      child: Text("Author: "),),
                                    Padding(padding: EdgeInsets.all(20),
                                      child: Text(dl.author ?? ''),)
                                  ],
                                ),Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(20),
                                      child: Text("Price: "),),
                                    Padding(padding: EdgeInsets.all(20),
                                      child: Text(dl.price ?? ''),)
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Padding(padding: EdgeInsets.all(20),
                                //       child: Text("Category: "),),
                                //     Padding(padding: EdgeInsets.all(20),
                                //       child: Text(dl.category ?? ''),)
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     Padding(padding: EdgeInsets.all(20),
                                //       child: Text("Book Status: "),),
                                //     Padding(padding: EdgeInsets.all(20),
                                //       child: Text(dl.bookstatus),)
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(20),
                                    child: Visibility(
                                    visible: dl.bookstatus == 'pending'? true:false,
                                    child: ElevatedButton(onPressed: () async {
                                      SharedPreferences b = await SharedPreferences.getInstance();
                                      var uid = b.getString("lid");
                                      var model_requests = requests();
                                      model_requests.reqstatus='pending';
                                      model_requests.reqdate=DateTime.now().toString();
                                      model_requests.user=int.parse(uid.toString());
                                      model_requests.book=dl.id;
                                      var rs = requestsservice();
                                      var buylist = await rs.rawqueryrequest("select * from requests where reqstatus = 'pending' and user = $uid ");
                                      if(buylist.length == 0){
                                        var rs1 = await rs.SaveRequest(model_requests);
                                      }
                                      else{
                                        Fluttertoast.showToast(
                                            msg: "Already Booked",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
                                      }

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>homeuser()));
                                    }, child: Text("Buy")),))
                                  ],
                                )

                              ]);
                        });
                  }})
        )
    );
  }

}


