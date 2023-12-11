import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/bookstatus.dart';
import 'package:sqllitebookmate/model/model_book.dart';
import 'package:sqllitebookmate/services/bookservice.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'package:sqllitebookmate/viewbooks.dart';



class usereditbooks extends StatefulWidget {
  final int id;
  final String bookname;
  final String image;
  final String price;
  final String author;
  final String category;
  final int category_id;
  final String bookstatus;

  usereditbooks({required this.id, required this.bookname, required this.image, required this.price, required this.author, required this.category, required this.category_id, required this.bookstatus });

  @override
  State<usereditbooks> createState() => _usereditbooksState();
}

class _usereditbooksState extends State<usereditbooks> {
  TextEditingController bookname = TextEditingController();
  TextEditingController authorname = TextEditingController();
  TextEditingController price = TextEditingController();
  int d = 0;
  final  clist = categoryservice();
  String image = "";
  List<Map<String, dynamic>> catnames = [];

  Future<List> Dropdowncategory() async {
    var c = await clist.readAllCategory();

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

    bookname.text=widget.bookname!;
    authorname.text=widget.author!;

    price.text=widget.price!;
    image=widget.image!;
    d=widget.category_id!;
    Dropdowncategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
          child: Column(
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
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Book Name",
                      border: OutlineInputBorder()
                  ),
                ),),
              Padding(padding: EdgeInsets.all(20),
                child: TextField(
                  controller: authorname,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Author Name",
                      border: OutlineInputBorder()
                  ),
                ),),
              Padding(padding: EdgeInsets.all(20),
                child: TextField(
                  controller: price,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
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
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () async {
                        SharedPreferences s = await SharedPreferences.getInstance();
                        var uid = s.getString("lid");
                        var model_book = book();
                        model_book.id = widget.id;
                        model_book.bookname = bookname.text;
                        model_book.image = image;
                        model_book.author = authorname.text;
                        model_book.category = d;
                        model_book.price = price.text;
                        model_book.bookstatus= widget.bookstatus;
                        model_book.user= int.parse(uid.toString());
                        var bs = bookservice();
                        var result = await bs.UpdateBook(model_book);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewbooks()));
                      }, child: Text("EDIT"))),
            ],
          ),)
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
