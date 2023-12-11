import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
      home: userviewfeedback(),
      debugShowCheckedModeBanner: false,
  ));
}


class feedbackdata{
  String id;
  String feedback;
  String feedbackdate;

  feedbackdata({
    required this.id,
    required this.feedback,
    required this.feedbackdate,
  });

}


class userviewfeedback extends StatefulWidget {
  @override
  State<userviewfeedback> createState() => userviewfeedback1();
}

class userviewfeedback1 extends State<userviewfeedback> {
  List<feedbackdata> demolist=[];
  @override
  void initState() {
    // TODO: implement initState
    viewfeedbackdata();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(
            future: viewfeedbackdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data==null){
                  return Container(
                    child: Text("No Feedback"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final dl = snapshot.data[index];
                        index=index+1;
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Sl no: "),
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
                                  child: Text("Date: "),
                                ),
                                SizedBox(width: 5,),
                                Expanded(child: Text(dl.feedbackdate)
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(height: 10,),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Text("Feedback: "),
                                ),
                                SizedBox(width: 5,),
                                Expanded(child: Text(dl.feedback)
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
                  );
                }
              })

      ),
    );
  }
  viewfeedbackdata() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    var vr= await http.post(Uri.parse(a.getString("url").toString()+"/userviewfeedback"),
        body: {"id":a.getString("lid").toString()});
    var res= jsonDecode(vr.body);

    for(var i in res['data']){
      feedbackdata ob = feedbackdata(id: i['id'].toString(), feedbackdate: i['feedbackdate'].toString(), feedback: i['feedback'].toString());
      demolist.add(ob);
    }
    print(demolist);
    return demolist;
  }
}
