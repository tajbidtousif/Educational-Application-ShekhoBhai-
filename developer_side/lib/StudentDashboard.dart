import 'package:developer_side/countingSession.dart';
import 'package:developer_side/logIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Add_post.dart';
import 'Blog_screen.dart';
import 'welcomePage.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'teacherdashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'navBar.dart';
import 'countingSession.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: size.height * .30,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage(""),
              // image:
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => navBar()),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Hello, Student",
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.w900)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.filter_list),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[


                      InkWell(
                      onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => teacherdashboard()),
                        );

                },
                    child: Container(

                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            //color: Colors.blue[100],
                          ),
                        ],
                      ),
                      child: Column(children: <Widget>[
                        Image.asset(
                          "assets/guideline.png",
                          width: 200,
                          height: 150,
                        ),
                        Text(
                          'Guide-Line',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                      ),


                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => teacherdashboard()),
                            );

                          },
                          child: Container(

                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                ),
                              ],
                            ),
                            child: Column(children: <Widget>[
                              SizedBox(height: 10),
                              Image.asset(
                                "assets/findcourse.png",
                                width: 200,
                                height: 140,
                              ),
                              Text(
                                'Find-Course',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ),
                        ),



                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => teacherdashboard()),
                            );

                          },
                          child: Container(

                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                ),
                              ],
                            ),
                            child: Column(children: <Widget>[
                              SizedBox(height: 10),
                              Image.asset(
                                "assets/messageicon.png",
                                width: 200,
                                height: 140,
                              ),
                              Text(
                                'Interactive Session',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ),
                        ),



                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Blog_screen()),
                            );

                          },
                          child: Container(

                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                ),
                              ],
                            ),
                            child: Column(children: <Widget>[
                              SizedBox(height: 12),
                              Image.asset(
                                "assets/posticon.png",
                                width: 200,
                                height: 130,
                              ),
                              Text(
                                'Post-Query',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ),
                        ),



                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => teacherdashboard()),
                            );

                          },
                          child: Container(

                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                ),
                              ],
                            ),
                            child: Column(children: <Widget>[
                              SizedBox(height: 10),
                              Image.asset(
                                "assets/bootcampnews.png",
                                width: 200,
                                height: 140,
                              ),
                              Text(
                                'Boot-Camp News',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
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
    ));
  }
}
