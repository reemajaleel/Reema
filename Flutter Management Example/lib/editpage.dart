import 'package:flutter/material.dart';
import 'package:sqlflutter2/services/categoryservice.dart';
import 'package:sqlflutter2/viewdata.dart';

import 'model/model_category.dart';




class editpage extends StatefulWidget {
  final category data;
  editpage({ required this.data});
  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  TextEditingController e = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    e.text = widget.data.name!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: TextField(
                controller: e,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.all(20),
              child: ElevatedButton(onPressed: () async {
                var model_category = category();
                model_category.id= widget.data.id;
                model_category.name = e.text;
                var cs = categoryservice();
                var result = await cs.UpdateCategory(model_category);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata()));
              }, child: Text("EDIT")))

        ],
      ),
    );
  }
}
