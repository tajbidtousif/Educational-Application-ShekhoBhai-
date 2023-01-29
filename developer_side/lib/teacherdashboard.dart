import 'package:developer_side/countingSession.dart';
import 'package:developer_side/logIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'studentHomePage.dart';
import 'navBar.dart';
import 'countingSession.dart';


class teacherdashboard extends StatefulWidget {
  const teacherdashboard({super.key});

  @override
  State<teacherdashboard> createState() => teacherdashboardState();
}

class teacherdashboardState extends State<teacherdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: ListView(
        children: [
          appbar(),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  /*view course*/
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/asATeacher.png",
                            width: 200,
                            height: 150,
                          ),
                          Text(
                            'Add New Course',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  /*view course*/

                  InkWell(
                    /*onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return const ScheduleScreen();

                                 }));
                               },*/
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/asATeacher.png",
                            width: 200,
                            height: 150,
                          ),
                          Text(
                            'View Course',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  /*Interactive Session*/

                  InkWell(
                    /*onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return const ScheduleScreen();

                                 }));
                               },*/
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/asATeacher.png",
                            width: 200,
                            height: 150,
                          ),
                          Text(
                            'Interactive Session',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  /*Add COurse*/
                  InkWell(
                    /*onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return const ScheduleScreen();

                                 }));
                               },*/
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/asATeacher.png",
                            width: 200,
                            height: 150,
                          ),
                          Text(
                            'Live Session',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  InkWell(
                    /*onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                  return const ScheduleScreen();

                                 }));
                               },*/
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Image.asset(
                            "assets/asATeacher.png",
                            width: 200,
                            height: 150,
                          ),
                          Text(
                            'Create Bootcamp',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                    ),
                  ),

                ],
              ))
        ],
      ),
    );
  }

  /*Appbar Constructor*/
  appbar() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )),
      child: Column(children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) {
                    return const navBar();
                  }));

                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                )),

            Row(
              children: [
                SizedBox(height: 50,),
                CircleAvatar( radius: 30,
                  backgroundImage: NetworkImage(
                      "https://cdn4.iconfinder.com/data/icons/modern-education-2/128/71-512.png"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Column(
                    children:  [
                      Text(
                        countingSession().userId.toString(),
                      ),

                    ],

                  ),

                ),

              ],

            ),
            SizedBox(height: 20,),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          ],
        ),
        SizedBox(
          height: 60,
        ),

        /*searchbar */
        TextField(
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


      ]),
    );
  }
}