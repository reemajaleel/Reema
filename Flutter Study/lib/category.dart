import 'package:flutter/material.dart';
import 'package:sqllitebookmate/model/model_category.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'package:sqllitebookmate/viewcategory.dart';


void main() {
  runApp(MaterialApp(
    home: categorynew(),
    debugShowCheckedModeBanner: false,
  ));
}

class categorynew extends StatefulWidget {
  @override
  category1 createState() => category1();
}

class category1 extends State<categorynew> {
  TextEditingController cat= TextEditingController();
  bool creq= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Category: ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: cat,
                            decoration: InputDecoration(
                              errorText: creq ? "Required" : null,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() async {
                          cat.text.isEmpty? creq = true : creq = false;

                          if(creq==false){
                            var model_category = category();
                            model_category.catname = cat.text;
                            var cs = categoryservice();
                            var rs = await cs.SaveCategory(model_category);
                            var cats = await cs.readAllCategory();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcategory()));
                          }
                        });

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,

                      ),
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
