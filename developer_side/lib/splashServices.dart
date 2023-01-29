// import 'dart:async';
// import 'package:developer_side/navBar.dart';
// import 'package:flutter/material.dart';
// import 'logIn.dart';
// import 'signup.dart';
// import 'welcomePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'teacherdashboard.dart';
//
// class splashServices{
//   void isLogin(BuildContext context)
//   {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final user = auth.currentUser;
//
//     if(user!=null)
//       {
//         Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context, '/teacherdashboard'));
//
//       }
//     }
// }