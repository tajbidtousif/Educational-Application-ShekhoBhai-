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


class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: ListView(
          children: [

            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage("https://images.hdqwalls.com/wallpapers/colorful-blur-4k-xw.jpg"),
                   fit: BoxFit.cover
                 )
                ),
                accountName: Text("Shah Tajbid Tousif"), accountEmail: Text("tajbidtousif@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network("https://www.w3schools.com/howto/img_avatar.png"),
                ),
              )

            ),

            ListTile(

              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) {
                  return const teacherdashboard();
                }));

              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) {
                  return const lonIn();
                }));
              },
            ),
          ],
        )

    );
  }
}
