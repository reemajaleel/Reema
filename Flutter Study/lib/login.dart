import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqllitebookmate/homeadmin.dart';
import 'package:sqllitebookmate/homeuser.dart';
import 'package:sqllitebookmate/model/model_login.dart';
import 'package:sqllitebookmate/reguser.dart';
import 'package:flutter/material.dart';
import 'package:sqllitebookmate/services/loginservice.dart';
void main() {
  runApp(MaterialApp(
    home: loginclass(),
    debugShowCheckedModeBanner: false,
  ));
}

class loginclass extends StatefulWidget {
  @override
  login1 createState() => login1();
}

class login1 extends State<loginclass> {
  TextEditingController uname= TextEditingController();
  TextEditingController password= TextEditingController();
  bool req = false, preq= false;
  List<Map<String, dynamic>> loginlist = [];
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
                    padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
                    child: Row(
                      children: [
                        // Text(
                        //   "Username: ",
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(

                            controller: uname,
                            decoration: InputDecoration(
                              filled: true,
                              errorText: req ? "Required" : null,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        // Text(
                        //   "Password: ",
                        //   style: TextStyle(
                        //       color: Colors.black, fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              errorText: preq? "Required" : null,
                              prefixIcon: Icon(Icons.password),
                              hintText: "Password"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          uname.text.isEmpty? req = true : req = false;
                          password.text.isEmpty? preq = true : preq = false;


                        });


                        if(req == false && preq == false)
                        {

                          final llist = loginservice();

                          // var login_service= login();
                          // login_service.username=uname.text;
                          // login_service.password=password.text;
                          // login_service.type ='admin';
                          // var ls = await llist.SaveLogin(login_service);

                          var res = await llist.queryOperation("select * from login where username = '${uname.text}' and password = '${password.text}'");
                         if(res.length == 0){
                           Fluttertoast.showToast(
                               msg: "Unknown  User",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.CENTER);
                         }
                         else{
                           print("${res[0]} hiiiiii");
                           var res2 = res[0];
                           if(res2["type"] == "admin"){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>homeadmin()));
                           }
                           else if(res2["type"] == "user"){
                             SharedPreferences a = await SharedPreferences.getInstance();
                             a.setString("lid", res2["id"].toString());
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>homeuser()));
                           }
                           else{
                             Fluttertoast.showToast(
                                 msg: "Unknown  User",
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.CENTER);
                           }

                         }


                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),

                  ),
                  Padding(padding: EdgeInsets.all(20),
                  child:GestureDetector(
                    child: Text("User sign up?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>reguser()));
                    },
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
