import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: previousbookings(),
    debugShowCheckedModeBanner: false,
  ));
}

class previousbookings extends StatefulWidget {
  @override
  State<previousbookings> createState() => _previousbookingsState();
}

class _previousbookingsState extends State<previousbookings> {
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
                                    child: Text("Date: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
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
                                    child: Text("Price: "),),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(""),)
                                ],
                              ),
                            ]
                        );
                      });
                }
              })),
    );
  }
}
