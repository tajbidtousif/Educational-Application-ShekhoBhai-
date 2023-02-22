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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (context,snapshot) {

                      final values = snapshot.data as DatabaseEvent;
                      final data = values.snapshot.value as Map;
                      final List<Map<dynamic, dynamic>> messages = [];
                      print("");
                      print(data);
                      data.forEach((key, value) {
                        final message = value as Map;
                        print(message);
                        final messageWidget = Text(message['message']);
                        messages.add(message);
                      });
                      messages.sort((a, b) => a['time'].compareTo(b['time']));
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          final isMe = message['sender'] == FirebaseAuth.instance.currentUser!.uid;
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['sender'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  color: isMe ? Colors.blue : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    child: Text(
                                      message['message'],
                                      style: TextStyle(
                                        color: isMe ? Colors.white : Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: messages.length,
                      );


                  }),
                ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      cursorColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(height: 0,fontSize: 19),
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        contentPadding: const EdgeInsets.all(20),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendMessage();
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(50)),

                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        'receiver' : widget.receiverId.toString(),
        'type' : 'text',
        'time' : time.toString()
      }).then((value){
        messageController.clear();
      });

    }

  }
}
