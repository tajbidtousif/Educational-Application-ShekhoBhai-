import 'dart:async';
import 'package:developer_side/navBar.dart';
import 'package:flutter/material.dart';
import 'logIn.dart';
import 'signup.dart';
import 'welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'teacherdashboard.dart';

class countingSession{
  static final countingSession _session = countingSession.internal();
String? userId;

factory countingSession(){
  return _session;
}

  countingSession.internal(

      );
}