import 'package:flutter/material.dart';
import 'package:sqllitebookmate/services/userservice.dart';

import 'model/model_user.dart';

void main() {
  runApp(MaterialApp(
    home: users(),
    debugShowCheckedModeBanner: false,
    routes: <String,WidgetBuilder>
    {
      '/viewuser':(BuildContext context)=>new users()
    },
  ));
}



// class userdemo {
//   final String id;
//   final String fname;
//   final String lname;
//   final String dob;
//   final String email;
//   final String ph;
//
//   userdemo({
//     required this.id,
//     required this.fname,
//     required this.lname,
//     required this.dob,
//     required this.email,
//     required this.ph,
//
//   });
//
// }


class users extends StatefulWidget {
    @override
  State<users> createState() => users1();
}

class users1 extends State<users> {
  late List <user> demolist = <user> [];
  final dlist = userservice();

  allusers() async {
    var u = await dlist.readAllUser();
    u.forEach((uobj){

      setState(() {
        var userdata = user();
        userdata.fname=uobj['fname'];
        userdata.lname=uobj['lname'];
        userdata.dob=uobj['dob'];
        userdata.email=uobj['email'];
        userdata.phone=uobj['phone'];
        demolist.add(userdata);
      });
      print("Hiiiii${demolist}");
    });
    return demolist;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allusers();
    print("hiiiiiiiiii");
  }






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
        child: ListView.builder(
          itemCount: demolist.length,
          itemBuilder: (context, index) {
            final dl = demolist[index];
            index = index + 1;
           return Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("Sl no: "),
                    ),
                    SizedBox(width: 100,),
                    Expanded(child: Text(index.toString())
                    )
                  ],
                ), Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("First Name: "),
                    ),
                    SizedBox(width: 60,),
                    Expanded(child: Text(dl.fname?? '')
                    )
                  ],
                ), Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("Last Name: "),
                    ),
                    SizedBox(width: 60,),
                    Expanded(child: Text(dl.lname?? '')
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("DOB: "),
                    ),
                    SizedBox(width: 100,),
                    Expanded(child: Text(dl.dob?? '')
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("Email: "),
                    ),
                    SizedBox(width: 95,),
                    Expanded(child: Text(dl.email?? '')
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(20),
                      child: Text("Phone Number: "),
                    ),
                    SizedBox(width: 40,),
                    Expanded(child: Text(dl.phone?? '')
                    )
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
      )


      ),
    );
  }
}
