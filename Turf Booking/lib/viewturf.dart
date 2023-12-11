import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: viewturf(),
    debugShowCheckedModeBanner: false,
  ));
}

class viewturf extends StatefulWidget {
  @override
  State<viewturf> createState() => _viewturfState();
}

class _viewturfState extends State<viewturf> {
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
                                    child: Text("Time Slot: "),),
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
                              )
                            ]
                        );
                      });
                }
              })),
    );
  }
}
