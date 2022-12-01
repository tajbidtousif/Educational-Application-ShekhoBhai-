import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logIn.dart';
import 'signup.dart';
import 'welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class studentHomePage extends StatefulWidget {
  const studentHomePage({Key? key}) : super(key: key);

  @override
  State<studentHomePage> createState() => _studentHomePageState();
}

class _studentHomePageState extends State<studentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
            padding: EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hello Student!',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 40, color: Colors.deepPurple),
                ),
              ],
            )
        )
    );
  }
}
