import 'package:developer_side/MessageScreen.dart';
import 'package:developer_side/StudentDashboard.dart';
import 'package:developer_side/teacherdashboard.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'teacherdashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'ForgetPasswordPage.dart';
import 'countingSession.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("Users");
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle:true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text("Inbox",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
          ),

        ),
      ),
      
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: ref,

          itemBuilder: (context, snapshot, animation, index) {
            if(countingSession().userId.toString() == snapshot.child("uid").value.toString()){
              return Container();
            }
            else{
              //  print("1st no ");
              //  print(countingSession().userId.toString());
              // print("2st no ");
              // print(snapshot.child('uid').value.toString());
              return Card(
                child: ListTile(
                  onTap: (){
                    // print(snapshot.child("name").value.toString());
                    // print(snapshot.child("image").value.toString());
                    // print(snapshot.child("email").value.toString());
                    // print(snapshot.child("uid").value.toString());
                   PersistentNavBarNavigator.pushNewScreen(context,
                       screen: MessageScreen(
                         name:snapshot.child("name").value.toString(),
                         image: snapshot.child("image").value.toString(),
                         email: snapshot.child("email").value.toString(),
                         receiverId: snapshot.child("uid").value.toString(),
                       ));
                  },
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),

                      child: snapshot.child('image').value.toString() == "" ? Icon(Icons.person_outline) :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          image:  NetworkImage(snapshot.child("image").value.toString()),
                        ),
                      )
                  ),


                  title: Text(snapshot.child("name").value.toString()),
                  subtitle: Text(snapshot.child("email").value.toString()),
                ),

              );
            }

            },
        ),
      ),
    );
  }
}
