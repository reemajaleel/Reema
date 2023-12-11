import 'package:flutter/material.dart';
import 'package:sqllitebookmate/services/complaintservice.dart';
import 'model/model_complaint.dart';
import 'view complaint.dart';


class sendreply extends StatefulWidget {
  late final String id;
  late final String name;
  late final String complaint;
  late final String user;
  late final String comdate;
  sendreply({required this.id,
  required this.name,
  required this.complaint,
  required this.user,
  required this.comdate});

    @override
  State<sendreply> createState() => sendreply1();
}

class sendreply1 extends State<sendreply> {
  TextEditingController reply= TextEditingController();
  String name="",complaint= "";
  bool rereq = false;
  final rlist = complaintsservice();
  List <Map<String, dynamic>> reply1 =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    complaint = widget.complaint;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Name: "),
                ),
                SizedBox(width: 5,),
                Expanded(child: Text(name)
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
                Expanded(child: Text(complaint)
                )
              ],
            ),
            Row(
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),
                  child: Text("Reply: "),
                ),
                SizedBox(width: 5,),
                Expanded(child: TextField(
                  controller: reply,
                  decoration: InputDecoration(
                    errorText: rereq? "Required" : null,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()
                  ),
                )
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Align(
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: (){
                      setState(()  {
                        reply.text.isEmpty? rereq = true : rereq = false;

                        if(rereq==false){
                         sam(widget.id, reply.text, widget.comdate, widget.user, widget.complaint);
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcomplaint()));
                        }
                      });


                }, child: Text("SEND")),
              ),
            )
            )
          ],
        ),
      ),
    );
  }


}

Future<void> sam(id, reply, comdate, user,complaint ) async {
  var model_complant = complaints();
  model_complant.id = int.parse(id);
  model_complant.comstatus= 'replied';
  model_complant.comdate=comdate;
  model_complant.complaint=complaint.toString();
  model_complant.user=int.parse(user);
  model_complant.reply=reply;
  var cs = complaintsservice();
  var replied = await cs.UpdateComplaint(model_complant);

}
