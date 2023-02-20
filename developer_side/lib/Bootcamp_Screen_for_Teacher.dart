import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:developer_side/Add_bootcamp_news.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:developer_side/navBar.dart';
import 'package:flutter/material.dart';
import 'StudentDashboard.dart';
import 'logIn.dart';
import 'signup.dart';
import 'welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'teacherdashboard.dart';

import 'Add_post.dart';

class Bootcamp_Screen_for_Teacher extends StatefulWidget {
  const Bootcamp_Screen_for_Teacher({Key? key}) : super(key: key);

  @override
  State<Bootcamp_Screen_for_Teacher> createState() => _Bootcamp_Screen_for_TeacherState();
}

class _Bootcamp_Screen_for_TeacherState extends State<Bootcamp_Screen_for_Teacher> {

  final dbRef = FirebaseDatabase.instance.ref().child('BootCampNews');
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafc),
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
          'BootCamp News',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
              onTap: (){

                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> Add_bootcamp_news())) ;
              },
              child: Icon(Icons.add,color: Colors.black)),
          SizedBox(width:20),

        ],
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Search with Boot-Camp news title',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
              ),
              onChanged: (String value){
                search = value;
              },

            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef.child("Boot Camp News List"),
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation,int index){
                  dynamic bb = snapshot.value;
                  String tempTitle = bb['pTitle'];

                  if(searchController.text.isEmpty)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * .25,
                                placeholder: "assets/logo.png.png",
                                image: bb['pImage'],
                                //image: snapshot.value!.["pImage"] ?? "default url",
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(bb['pTitle'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(bb['pDescription'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else if(tempTitle.toLowerCase().contains(searchController.text.toString()))
                  {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * .25,
                                placeholder: "assets/logo.png.png",
                                image: bb['pImage'],
                                //image: snapshot.value!.["pImage"] ?? "default url",
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(bb['pTitle'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(bb['pDescription'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else{
                    return Container();
                  }


                },
              ),
            )
          ],
        ),
      ),

    );
  }
}

