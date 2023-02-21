import 'dart:io';

import 'package:developer_side/countingSession.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ProfileController with ChangeNotifier{
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image ;

  Future pickGalleryImage(BuildContext context)async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
    if(pickedFile!=null)
      {
        _image = XFile(pickedFile.path);
        notifyListeners();
        uploadImage(context);
      }
  }

  Future pickCameraImage(BuildContext context)async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    if(pickedFile!=null)
    {
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context){
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
          content: Container(
          height: 120,
        child:Column(
        children: [
          ListTile(
        onTap: (){
        pickCameraImage(context);
        Navigator.pop(context);

        },
        leading: Icon(Icons.camera,
        color: Colors.black,
        ),
        title: Text("Camera"),
        ),

        ListTile(
        onTap: (){
        pickGalleryImage(context);
        Navigator.pop(context);
        },
        leading: Icon(Icons.browse_gallery,
        color: Colors.black,
        ),
        title: Text("Gallery"),
        ),

        ],
        ),
        ),

          );
        }
    );
  }

  void uploadImage(BuildContext context)async
  {
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref('/profileImage'+countingSession().userId.toString());
    firebase_storage.UploadTask upLoadTask = storageRef.putFile(File(image!.path).absolute);
    await Future.value(upLoadTask);
    final newUrl = await storageRef.getDownloadURL();
    ref.child(countingSession().userId.toString()).update({
      'image': newUrl.toString()
    }).then((value){
      FirebaseAuth.instance.currentUser!.updatePhotoURL(newUrl.toString());
      Fluttertoast.showToast(
          msg: "Image Uploaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[500],
          textColor: Colors.white,
          fontSize: 16.0
      );

    }).onError((error, stackTrace){
      Fluttertoast.showToast(
          msg: "Something went wrong,Try again later!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[500],
          textColor: Colors.white,
          fontSize: 16.0
      );
        });

  }
}