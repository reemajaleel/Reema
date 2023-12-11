import 'package:sqllitebookmate/services/categoryservice.dart';
import 'model/model_category.dart';
import 'viewallbooks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: userviewcategory(),
    debugShowCheckedModeBanner: false,
    routes: <String,WidgetBuilder>
    {
      '/viewdemo':(BuildContext context)=>new userviewcategory()
    },
  ));
}




class userviewcategory extends StatefulWidget {
  @override
  State<userviewcategory> createState() => userviewcategory1();
}

class userviewcategory1 extends State<userviewcategory> {
  late List<category> catnames = <category> [];
  final  clist = categoryservice();

  allcats() async {
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
    allcats();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(
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
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>viewallbooks(data:dl.id ?? '')));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Category Number: "),
                                  ),
                                  SizedBox(width: 5,),
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
                                  SizedBox(width: 55,),
                                  Expanded(child: Text(dl.catname?? '')
                                  )
                                ],
                              ),

                            ],
                          ),
                        );
                      }
                  );
                }


              })

      ),
    );
  }


}