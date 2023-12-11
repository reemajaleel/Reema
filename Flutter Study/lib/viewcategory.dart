import 'package:flutter/material.dart';
import 'package:sqllitebookmate/model/model_category.dart';
import 'package:sqllitebookmate/services/categoryservice.dart';
import 'editcategory.dart';
import 'category.dart';

void main() {
  runApp(MaterialApp(
    home: viewcategory(),
    debugShowCheckedModeBanner: false,
    routes: <String,WidgetBuilder>
    {
      '/viewcategory':(BuildContext context)=>new viewcategory()
    },
  ));
}



class demo {
  final String id;
  final String catname;

  demo({
    required this.id,
    required this.catname,

  });

}
class viewcategory extends StatefulWidget {
  @override
  State<viewcategory> createState() => viewcategory1();
}

class viewcategory1 extends State<viewcategory> {
  late List<category> catnames = <category> [];
  final  clist = categoryservice();

  allcat() async {
    var c = await clist.readAllCategory();
    c.forEach((cobj){
      setState(() {
        var catdata = category();
        catdata.id=cobj['id'];
        catdata.catname=cobj['catname'];
        catnames.add(catdata);
      });
    });
    return catnames;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allcat();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>categorynew()));
      },
      child: Icon(Icons.add, color: Colors.black),),


      body: Container(
          child: FutureBuilder(
              // future: viewdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(catnames == null){
                  return Container(
                    child: Text("No category"),
                  );
                }
                else{
                  return ListView.builder(
                      itemCount: catnames.length,
                      itemBuilder: (context, index) {
                        final dl = catnames[index];
                        index=index+1;
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Category Number: "),
                                ),
                                SizedBox(width: 50,),
                                Expanded(child: Text(index.toString())
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Category: "),
                                ),
                                SizedBox(width: 100,),
                                Expanded(child: Text(dl.catname?? ''),
                                ),
                                 ]

                                ),


                            Row(
                              children: [
                                Padding(padding: EdgeInsets.all(20),
                                    child: Align(
                                      child: Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(primary: Colors.black),
                                              onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> editcategory(data: dl)));
                                          },
                                              child: Text("EDIT"))
                                      ),
                                    )
                                ),
                                Padding(padding: EdgeInsets.all(20),
                                    child: Align(
                                      child: Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(primary: Colors.black),
                                              onPressed: () {

                                                clist.deleteCategory(dl.id);
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> viewcategory()));

                                          }, child: Text("DELETE"))
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Divider(
                              height: 100,
                              color: Colors.black,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            )
                          ],
                        );
                      }
                  );
                }


              })

      ),
    );
  }
}