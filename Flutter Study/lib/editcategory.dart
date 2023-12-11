import 'package:flutter/material.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'model/model_category.dart';
import 'viewcategory.dart';


class editcategory extends StatefulWidget {

  final category data;
  editcategory({ required this.data });

  @override
  editcategory1 createState() => editcategory1();
}

class editcategory1 extends State<editcategory> {
  TextEditingController cat = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cat.text=widget.data.catname!;
  }



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
                      onPressed: () async {
                        var model_category = category();
                        model_category.id = widget.data.id;
                        model_category.catname = cat.text;
                        var cs = categoryservice();
                        var result = await cs.UpdateCategory(model_category);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> viewcategory()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        "EDIT",
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
