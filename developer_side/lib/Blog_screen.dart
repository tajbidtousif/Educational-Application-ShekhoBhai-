import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'Add_post.dart';

class Blog_screen extends StatefulWidget {
  const Blog_screen({Key? key}) : super(key: key);

  @override
  State<Blog_screen> createState() => _Blog_screenState();
}

class _Blog_screenState extends State<Blog_screen> {
  //final dbRef = FirebaseFirestore.instance.collection('Posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('News Feed'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
               
               Navigator.push(context,MaterialPageRoute(
                   builder: (context)=> Add_post())) ;
              },
              child: Icon(Icons.add)),
          SizedBox(width:20),
          
        ],
      ),

      // body: Column(
      //   children: [
      //   Expanded(
      //       child: FirebaseAnimatedList(
      //         query: dbRef.child('post_list'),
      //         itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation,int index){
      //           return Column(
      //             children: [
      //               FadeInImage.assetNetwork(
      //                   placeholder: "assets/logo.png.png",
      //                   image: snapshot.value['pImage'],
      //               )
      //             ],
      //           );
      //
      //         },
      //       ),
      //   )
      //   ],
      // ),

    );
  }
}

