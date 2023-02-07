import 'package:developer_side/StudentDashboard.dart';
import 'package:developer_side/teacherdashboard.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'ForgetPasswordPage.dart';
import 'countingSession.dart';

class MessageScreen extends StatefulWidget {
  final String image, name, email, receiverId;
  const MessageScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.email,
    required this.receiverId,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("Chat");
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          widget.name.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Text(index.toString());
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(child:
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type Message',
                                    icon: Icon(Icons.message),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        sendMessage();
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.only(right: 1),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blueAccent,
                                          child: Icon(Icons.send, color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                    ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                },
                              )))),


                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(){
    if(messageController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Enter message to send",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[500],
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else{
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      ref.child(time).set({
        'isSeen' : false,
        'message' : messageController.text.toString(),
        'sender' : countingSession().userId.toString(),
        'receiver' : widget.receiverId ,
        'type' : 'text',
        'time' : time.toString()
      }).then((value){
        messageController.clear();
      });

    }

  }
}
