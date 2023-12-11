import 'dart:convert';

import 'package:sqllitebookmate/model/model_complaint.dart';
import 'package:sqllitebookmate/services/complaintservice.dart';
import 'package:sqllitebookmate/services/userservice.dart';

import 'sendreply.dart';
import 'userviewcategory.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: viewcomplaint(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>
      {
        '/viewcom':(BuildContext context)=>new viewcomplaint()
    }
  ));
}




class viewcomplaint extends StatefulWidget {
    @override
  State<viewcomplaint> createState() => viewcomplaint1();
}

class viewcomplaint1 extends State<viewcomplaint> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  final clist = complaintsservice();
  List <Map<String, dynamic>> demolist = [];


  usercomplaint() async {
    var c = await clist.readAllComplaint();
    SharedPreferences sh = await SharedPreferences.getInstance();
    c.forEach((cobj) async {
      print("hiiiiiiiiiiiiiiiiiii $cobj");
      var uobj = await clist.rawquerycomplaint("select * from user where id = ${cobj['user']} ");
      setState(() {


          demolist.add({
            'id': cobj['id'],
            'complaint': cobj['complaint'],
            'comdate': cobj['comdate'],
            'comstatus': cobj['comstatus'],
            'reply': cobj['reply'],
            'user': cobj['user'],
            'name': uobj[0]['fname'].toString()+" "+uobj[0]['lname'].toString(),

          });




      });

    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usercomplaint();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
        child: FutureBuilder(
            // future: viewcom(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(demolist == null){
                return Container(
                  child: Text("No Complaints"),
                );
              }
              else {
                return Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Expanded(child: Text("Date")),
                        SizedBox(width: 5, height: 50,),
                        Expanded(child: TextField(
                          controller: fromdate,
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder()
                          ),
                        ),),
                        SizedBox(width: 5, height: 50,),
                        Expanded(child: Text("to")),
                        SizedBox(width: 5, height: 50,),
                        Expanded(child: TextField(
                            controller: todate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder()
                            )),),
                        SizedBox(width: 5, height: 50,),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.black),
                                onPressed: () async {
    demolist.clear();

    print("object $demolist");

    setState(() {
      demolist = demolist;
    });

    var u1obj = await clist.rawquerycomplaint("select * from complaints, user where complaints.user = user.id and complaints.comdate between '${fromdate.text} ' and '${todate.text}' ");
    print(u1obj);
    u1obj.forEach((c1obj) async {
    setState(() {


    demolist.add({
    'id': c1obj['id'],
    'complaint': c1obj['complaint'],
    'comdate': c1obj['comdate'],
    'comstatus': c1obj['comstatus'],
    'reply': c1obj['reply'],
    'user': c1obj['user'],
    'name': u1obj[0]['fname'].toString()+" "+u1obj[0]['lname'].toString(),

    });


    });

    return demolist;
      });}, child: Text("Search")))
                      ],
                    ),
                 Expanded(child:    ListView.builder(
                     itemCount: demolist.length,
                     itemBuilder: (context, index){

                       // index=index+1;
                       if(demolist.length > 0){
                         final dl = demolist[index];
                         return Column(
                           children: [

                             // Row(
                             //   children: [
                             //     SizedBox(height: 50,),
                             //     Padding(padding: EdgeInsets.all(20),
                             //       child: Text("Sl no: "),
                             //     ),
                             //     SizedBox(width: 5,),
                             //     Expanded(child: Text(index.toString()))
                             //   ],
                             // ),
                             Row(
                               children: [
                                 SizedBox(height: 50,),
                                 Padding(padding: EdgeInsets.all(20),
                                   child: Text("Date: "),
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(child: Text(dl["comdate"]))
                               ],
                             ),
                             Row(
                               children: [
                                 SizedBox(height: 10,),
                                 Padding(padding: EdgeInsets.all(20),
                                   child: Text("Name: "),
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(child: Text(dl["name"])
                                 )
                               ],
                             ),
                             Row(
                               children: [
                                 SizedBox(height: 10,),
                                 Padding(padding: EdgeInsets.all(20),
                                   child: Text("Complaint: "),
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(child: Text(dl["complaint"])
                                 )
                               ],
                             ),
                             // Row(
                             //   children: [
                             //     SizedBox(height: 10,),
                             //     Padding(padding: EdgeInsets.all(20),
                             //       child: Text("Status: "),
                             //     ),
                             //     SizedBox(width: 5,),
                             //     Expanded(child: Text(dl.comstatus)
                             //     )
                             //   ],
                             // ),
                             Row(
                               children: [
                                 SizedBox(height: 10,),
                                 Padding(padding: EdgeInsets.all(20),
                                   child: Text("Reply: "),
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(child: Text(dl["reply"])
                                 )
                               ],
                             ),

                             Row(
                               children: [
                                 SizedBox(height: 10,),
                                 Padding(padding: EdgeInsets.all(20),
                                     child: Visibility(
                                       visible: dl["comstatus"] == 'pending'? true:false,
                                       child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(primary: Colors.black),
                                           onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=> sendreply(id: dl["id"].toString(),name:dl["name"].toString(), complaint: dl["complaint"].toString(),user: dl["user"].toString(), comdate: dl["comdate"].toString())));
                                           }, child: Text("SEND REPLY")),)
                                 ),
                                 SizedBox(width: 5,),
                                 Expanded(child: Text("")
                                 )
                               ],
                             ),
                             Divider(
                               height: 50,
                               color: Colors.black,
                               thickness: 1,
                               indent: 10,
                               endIndent: 10,
                             )
                           ],
                         );
                       }

                       else{
                         return Container(
                           child: Text("Noo data"),
                         );
                       }
                     }))
                  ],
                );
              }
            }),
      )
        

    );
  }


}
