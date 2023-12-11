import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: turfviewbookings(),
    debugShowCheckedModeBanner: false,
  ));
}

class turfviewbookings extends StatefulWidget {
  @override
  State<turfviewbookings> createState() => _turfviewbookingsState();
}

class _turfviewbookingsState extends State<turfviewbookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
          child: FutureBuilder(

              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.data == null) {
                  return Container(
                    child: Text("No data"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final dl = snapshot.data[index];
                        index = index + 1;
                        return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Sl no: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(index.toString()),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Turf Name: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Name: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Date: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Time: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Amount: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text("Payment Status: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              )
                            ]
                        );
                      });
                }
              })),
    );
  }
}
