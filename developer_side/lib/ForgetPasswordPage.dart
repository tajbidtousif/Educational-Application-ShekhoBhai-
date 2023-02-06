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


class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late String txtemail;
  final _emailController = TextEditingController();

  @override

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text("Password reset link has been sent to your email"),

            );
          }
      );
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(
       context: context,
       builder: (context){
         return AlertDialog(
           content: Text(e.message.toString()),
         );
       }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Recovery'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
            child: Text('Reset',
                style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0.0),
            child: Text('Password?',
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
          ),


          //------------------- email text field-------------------


          SizedBox(height: 50),
          TextFormField(
              controller: _emailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'E-mail',
              ),
              onSaved: (value) {
                txtemail = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              }),
          SizedBox(height: 20),

          Center(
            child: MaterialButton(
              onPressed: passwordReset,
              child: Text(
                "Reset Password",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
