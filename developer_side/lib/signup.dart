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

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  late String txtname, txtemail, txtpassword, txtconpassword, txtrole = '';
  final databaseRef = FirebaseDatabase.instance.reference();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _conpassword = TextEditingController();

  void _resetItem() {
    _name.clear();
    _email.clear();
    _password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Sign-Up'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    const SizedBox(height: 40,),

                    Text(
                      'ShekhoBha!', style:
                    GoogleFonts.bebasNeue(
                        fontSize: 40,
                        color: Colors.deepPurple
                    ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'Know-Ask-Learn-Grow',
                      style: GoogleFonts.bebasNeue(
                        fontSize:20,

                      ),
                    ),
                    const SizedBox(height: 50),


                    TextFormField(

                        textAlign: TextAlign.center,
                        controller: _name,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Full-Name',
                        ),
                        onSaved: (value) {
                          txtname = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        textAlign: TextAlign.center,
                        controller: _email,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
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
                    SizedBox(height: 10.0),
                    TextFormField(
                        textAlign: TextAlign.center,
                        controller: _password,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Password',
                        ),
                        onSaved: (value) {
                          txtpassword = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        }),

                    TextFormField(
                        textAlign: TextAlign.center,
                        controller: _conpassword,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Confirm Password',
                        ),
                        onSaved: (value) {
                          txtconpassword = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        }),


                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: 'Role',
                      ),
                      value: txtrole.isNotEmpty ? txtrole : null,

                      items: <String>['User', 'Admin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          txtrole = value.toString();
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Expanded(

                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(20),


                            ),


                          child: MaterialButton(
                            onPressed: () {
                              _resetItem();
                            },
                            child: Text('Reset', style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          ),),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(

                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(20),


                            ),

                          child: MaterialButton(

                            onPressed: () {
                              print(txtrole);
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if(txtname.isNotEmpty && txtemail.isNotEmpty && txtpassword.isNotEmpty && txtrole.isNotEmpty)
                                {
                                  insertdata(txtname, txtemail, txtpassword, txtrole);
                                }
                              }
                            },
                            child: Text('SignUp', style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          ),

                        ),),

                      ],

                    ),
                    SizedBox(height: 30.0),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => lonIn()
                            )
                        );
                      },
                      child: const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )),

        )
    );

  }
  void insertdata(String name, String email, String password, String role) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      databaseRef.child("Users").child(value.user!.uid).set({
        'name': name,
        'email': email,
        // 'password': password,
        'role': role,
      });
      if (role == 'Admin') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => teacherdashboard()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => studentHomePage()));
      }
    });

    _name.clear();
    _email.clear();
    _password.clear();

  }
}
