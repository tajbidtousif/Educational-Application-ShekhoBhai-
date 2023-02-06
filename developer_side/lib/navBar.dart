import 'package:developer_side/countingSession.dart';
import 'package:developer_side/profile.dart';
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
                  child: Image.network("https://www.w3schools.com/howto/img_avatar.png",
                  width: 100,
                    height:100
                  ),
                ),
              ),


            ),
            SizedBox(height: 15,),

            ListTile(

              leading: Icon(Icons.account_circle,color: Colors.blueAccent),
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) {
                  return  ProfileScreen();
                }));

              },
            ),


            ListTile(
              leading: Icon(Icons.message,
              color: Colors.blueAccent),
              title: Text('Messages'),
              onTap: () {

              },
            ),

            ListTile(

              leading: Icon(Icons.settings,color: Colors.blueAccent),
              title: Text('Settings'),
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) {
                //   return const teacherdashboard();
                // }));

              },
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.blueAccent),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth auth = FirebaseAuth.instance;

                auth.signOut().then((value){
                  countingSession().userId = '';
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>lonIn()));
                });
              },
            ),
          ],
        )

    );
  }
}
