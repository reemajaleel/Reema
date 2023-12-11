import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'useraddbooks.dart';
import 'usereditbooks.dart';
import 'package:flutter/material.dart';



class viewbooks extends StatefulWidget {
  @override
  State<viewbooks> createState() => _viewbooksState();
}

class _viewbooksState extends State<viewbooks> {

  final blist = bookservice();
  final catlist = categoryservice();
  List <Map<String, dynamic>> bookname = [];

  allbooks() async {
    var c = await blist.readAllBook();
    SharedPreferences sh = await SharedPreferences.getInstance();
    c.forEach((cobj) async {
      var catobj= await catlist.rawquerycategory("select * from category where id = ${cobj['category']} ");
      setState(() {

        if(sh.getString("lid").toString() == cobj['user'].toString()){
          bookname.add({
            'id': cobj['id'],
            'bookname': cobj['bookname'],
            'image': cobj['image'],
            'author': cobj['author'],
            'price': cobj['price'],
            'category': catobj[0]["catname"],
            'category_id': catobj[0]["id"],
            'bookstatus': cobj['bookstatus']
          });
        }



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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>useraddbooks()));
        },child: Icon(Icons.add),
      ),
      body: Container(
          child: FutureBuilder(

              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(bookname == null){
                  return Container(
                    child:Center(
                      child:  Text("No books"),
                    ),
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
                                    child: Text(dl["bookname"] ?? ''),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: CircleAvatar(
                                      radius: 50, backgroundImage: MemoryImage(base64Decode(dl["image"]?? '')),
                                    ))
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Author: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl["author"]?? ''),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Price: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl["price"]?? ''),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Category: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl["category"]?? ''),)
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Book Status: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(dl["bookstatus"]?? ''),)
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                  child:IconButton(

                                      onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>usereditbooks(id:dl["id"],bookname: dl["bookname"], image: dl["image"], price: dl["price"], author: dl["author"], category: dl["category"], category_id: dl["category_id"], bookstatus: dl["bookstatus"])));
                                  }, icon:  Icon(Icons.edit)),
                                  ),Padding(padding: EdgeInsets.all(20),
                                  child:IconButton(

                                      onPressed: () {
                                        blist.deleteBook(dl["id"]);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbooks()));
                                  }, icon:  Icon(Icons.delete)),
                                  ),
                                ],
                              )

                            ]);
                      });
                }})
      )
    );
  }
}


