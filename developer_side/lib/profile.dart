import 'dart:io';

import 'package:developer_side/ProfileController.dart';
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

import 'countingSession.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref().child('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child){
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                    stream: ref.child(countingSession().userId.toString()).onValue,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                    child: Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                            Border.all(color: Colors.black, width: 3)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: provider.image == null ? map['image'].toString()==""?const Icon(Icons.person,size: 35,):
                                          Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                map["image"].toString(),
                                              ),
                                              loadingBuilder:
                                                  (context, child, loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return Center(
                                                    child: CircularProgressIndicator());
                                              },
                                              errorBuilder: (context, object, stack) {
                                                return Container(
                                                    child: Icon(Icons.error_outline,
                                                        color: Colors.red));
                                              }):
                                              Image.file(
                                                File(provider.image!.path).absolute
                                              )
                                        )
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    provider.pickImage(context);
                                  },

                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.add,size: 19,color:Colors.white),
                                ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ReusableRow(
                              title: "Name",
                              value: map['name'],
                              iconData: Icons.person,
                            ),
                            ReusableRow(
                              title: "Email",
                              value: map['email'],
                              iconData: Icons.email,
                            ),
                            ReusableRow(
                              title: "Role",
                              value: map['role'],
                              iconData: Icons.rotate_left,
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: Text(
                              "Something went wrong",
                              style: GoogleFonts.poppins(fontSize: 20),
                            ));
                      }
                    }),
              ),
            );
          },
        ),
      )
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  const ReusableRow(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,style: Theme.of(context).textTheme.subtitle2,),
          leading: Icon(iconData,),
          trailing: Text(value,style: Theme.of(context).textTheme.subtitle2,),
        ),
        Divider(color: Colors.black.withOpacity(0.4))
      ],
    );
  }
}
