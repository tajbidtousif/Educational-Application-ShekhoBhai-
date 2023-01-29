import 'package:developer_side/teacherdashboard.dart';
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
import 'package:firebase_storage/firebase_storage.dart';
import 'studentHomePage.dart';
import 'ForgetPasswordPage.dart';
import 'countingSession.dart';

class lonIn extends StatefulWidget {
  const lonIn({Key? key}) : super(key: key);
  @override
  State<lonIn> createState() => _lonInState();
}

class _lonInState extends State<lonIn> {
  bool _secureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  final _auth = FirebaseAuth.instance;

  final dbRef = FirebaseDatabase.instance.ref().child("Users");

  Future<void> _signIn() async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      //     .then(value){
      //   countingSession().userId = value.user!.uid.toString();
      // };
      if (newUser != null) {
        final User? user = _auth.currentUser;
        final userID = user?.uid;

        await FirebaseDatabase.instance
            .ref()
            .child("Users")
            .child(userID!)
            .once()
            .then((data) {
          //print(data.snapshot.value);
          var Data = data.snapshot.value as Map;

          print(Data.keys);
          print(Data.length);
          print(Data['role']);

          if (Data['role'] == 'Admin') {
            //print("dhuksi!");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => teacherdashboard()));
          } else if (Data['role'] as String == 'User') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => studentHomePage()));
          }
        });
      } else {
        print("Error!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  Text(
                    'ShekhoBha!',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 40, color: Colors.deepPurple),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Know-Ask-Learn-Grow',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 25),

                  //------------------- email text field-------------------

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.0),
                              child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username or E-mail',
                                    icon: Icon(Icons.email),
                                  ),
                                  onSaved: (value) {
                                    _email = value!;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                  })))),

                  const SizedBox(
                    height: 10,
                  ),

                  //--------------- Password Text Field--------------------

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    icon: Icon(Icons.security),
                                    suffixIcon: IconButton(
                                      icon: Icon(_secureText
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_sharp),
                                      onPressed: () {
                                        setState(() {
                                          _secureText = !_secureText;
                                        });
                                      },
                                    )),
                                onSaved: (value) {
                                  _password = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                },
                                obscureText: _secureText,
                              )))),


                  const SizedBox(
                    height: 20,
                  ),

//------------- Sign In Button -------------------

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _signIn();
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()));
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //-------------Don't have an account? ------------------

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
