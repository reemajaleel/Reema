import 'package:flutter/material.dart';
import 'package:sqlflutter2/adddata.dart';
import 'package:sqlflutter2/editpage.dart';
import 'package:sqlflutter2/services/categoryservice.dart';
import 'package:sqlflutter2/model/model_category.dart';

void main(){
  runApp(MaterialApp(
    home: viewdata(),
    debugShowCheckedModeBanner: false,
  ));
}

class viewdata extends StatefulWidget {
  @override
  State<viewdata> createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
  late List<category> catname = <category> [];
  final clist = categoryservice();

  allusers() async {
    var c = await clist.readAllCategory();
    c.forEach((cobj){
      setState(() {
        var catdata= category();
        catdata.id=cobj['id'];
        catdata.name=cobj['name'];
        catname.add(catdata);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: catname.length,
        itemBuilder: (context, index) {
          final dl = catname[index];
          index = index + 1;
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Sl no: "),),
                  Padding(padding: EdgeInsets.all(20),
                    child: Text(index.toString()),),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Data: "),),
                  Padding(padding: EdgeInsets.all(20),
                    child: Text(dl.name?? ''),),
                ],
              ),Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>editpage(data: dl)));
                    }, child: Text("EDIT"))),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(onPressed: (){
                        clist.deleteCategory(dl.id);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata()));
                      }, child: Text("DELETE")))
                ],
              ),


            ],
          );
        }),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
        onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>adddata()));
    }),
    );
  }
}
