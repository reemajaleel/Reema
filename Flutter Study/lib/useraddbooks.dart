import 'dart:convert';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/model/model_book.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqllitebookmate/model/model_user.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'package:sqllitebookmate/viewbooks.dart';

import 'model/model_category.dart';
void main(){
  runApp(MaterialApp(
    home: useraddbooks(),
    debugShowCheckedModeBanner: false,
  ));
}


class useraddbooks extends StatefulWidget {
  @override
  State<useraddbooks> createState() => _useraddbooksState();
}

class _useraddbooksState extends State<useraddbooks> {
  TextEditingController bookname = TextEditingController();
  TextEditingController authorname = TextEditingController();
  TextEditingController price = TextEditingController();
  int d = 0;
  final  clist = categoryservice();
  String image = "";
  List<Map<String, dynamic>> catnames = [];

  Future<List> Dropdowncategory() async {
    var c = await clist.readAllCategory();
    catnames.add({
      "id":0,
      "catname" : "select a category"
    });
    c.forEach((cobj){
      catnames.add(
          {
        'id' : cobj['id'],
        'catname' : cobj['catname']
      });
    });

    setState(() {
      catnames =catnames;

    });

    return catnames;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Dropdowncategory();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () async {
              print("Circle avatar is clicked");
              image= await pickImage();
              setState(() {
                image = image;
              });
            },
            child:image.isEmpty? CircleAvatar(radius: 50): CircleAvatar(radius: 50, backgroundImage: MemoryImage(base64Decode(image)), ),
          )
    ),
          Padding(padding: EdgeInsets.all(20),
          child: TextField(
            controller: bookname,
            decoration: InputDecoration(
              hintText: "Book Name",
              border: OutlineInputBorder()
            ),
          ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: authorname,
              decoration: InputDecoration(
                  hintText: "Author Name",
                  border: OutlineInputBorder()
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(
              controller: price,
              decoration: InputDecoration(
                  hintText: "Price",
                  border: OutlineInputBorder()
              ),
            ),),
          Padding(padding: EdgeInsets.all(20),
            child: DropdownButton(
              value: d.toString(),
              items: catnames.map<DropdownMenuItem<String>>((dynamic value) {

                print(value);
                return DropdownMenuItem<String>(
                  value: value["id"].toString(),
                  child: Text(value["catname"].toString()),
                );



              }).toList(),
              onChanged: (value) {
                print(value);
                setState(() {
                  d = int.parse(value.toString());
                });
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(onPressed: () async {
              SharedPreferences a = await SharedPreferences.getInstance();
              var uid = a.getString("lid");
              var model_book = book();
              model_book.bookname = bookname.text;
              model_book.image = image;
              model_book.author = authorname.text;
              model_book.price = price.text;
              model_book.bookstatus = 'pending';
              model_book.category = d;
              model_book.user = int.parse(uid.toString()) ;
              var bs = bookservice();
              var rs = await bs.SaveBook(model_book);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbooks()));
            }, child: Text("ADD"))),
        ],
      ),
    );

  }
  Future<String> pickImage() async {
    // XFile is now recommended to use with ImagePicker
    XFile? xfile;

    // This Line of Code will pick the image from your gallery
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    //Our XFile variable is nullable so we've to check if we've picked the image or not
    if (xfile != null) {
      // Now we're converting our image into Uint8List
      Uint8List bytes = await xfile.readAsBytes();

      // Here we're converting our image to Base64
      String encode = base64Encode(bytes);

      // Returning Base64 Encoded Image
      return encode;
    } else {
      print('Pick Image First');
      return 'Error';
    }
  }


}