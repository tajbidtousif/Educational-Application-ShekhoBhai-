import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ProfileController with ChangeNotifier{
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

        },
        leading: Icon(Icons.camera,
        color: Colors.black,
        ),
        title: Text("Camera"),
        ),

        ListTile(
        onTap: (){

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
}