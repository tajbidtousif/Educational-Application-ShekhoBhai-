import 'package:developer_side/ComputerGraphics.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Oop.dart';
import 'TOC.dart';

class FindCourse extends StatefulWidget {
  const FindCourse({super.key});

  @override
  State<FindCourse> createState() => _FindCourseState();
}

class _FindCourseState extends State<FindCourse> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Find your Course',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .90,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 20,
                          children: <Widget>[


                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ComputerGraphics()),
                                );

                              },
                              child: Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 50,
                                      spreadRadius: -13,
                                      //color: Colors.blue[100],
                                    ),
                                  ],
                                ),
                                child: Column(children: <Widget>[
                                  SizedBox(height: 50),
                                  Text(
                                    'Computer Graphics',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w600),
                                  ),
                                ]),
                              ),
                            ),


                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TOC()),
                                );

                              },
                              child: Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[300],
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 50,
                                      spreadRadius: -13,
                                      //color: Colors.blue[100],
                                    ),
                                  ],
                                ),
                                child: Column(children: <Widget>[
                                  SizedBox(height: 60),
                                  Text(
                                    'TOC',
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.w600),
                                  ),
                                ]),
                              ),
                            ),



                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Oop()),
                                );

                              },
                              child: Container(

                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 17),
                                      blurRadius: 50,
                                      spreadRadius: -13,
                                      //color: Colors.blue[100],
                                    ),
                                  ],
                                ),
                                child: Column(children: <Widget>[
                                  SizedBox(height: 60),

                                  Text(
                                    'OOP',
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.w600),
                                  ),
                                ]),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );



  }
}

