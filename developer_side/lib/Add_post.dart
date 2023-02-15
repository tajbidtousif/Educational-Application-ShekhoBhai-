import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:developer_side/Blog_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Add_post extends StatefulWidget {
  const Add_post({Key? key}) : super(key: key);

  @override
  State<Add_post> createState() => _Add_postState();
}

class _Add_postState extends State<Add_post> {
  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.ref().child('Posts');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image ;
  final picker = ImagePicker();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriotionController = TextEditingController();

  Future getImageGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }else{
        print('No image selected');
        toastMessage("No image selected");
      }
    });
  }

  Future getCameraImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }

  void dialog(context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
            ),
            content: Container(
              height: 120,
              child: Column(
                children:[
                  InkWell(
                    onTap: (){
                    getCameraImage();
                    Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      getImageGallery();
                      Navigator.pop(context); 
                    },
                    child: ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                    ),
                  ),
                ]
              ),
            ),

          );
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
            'Add Experience',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
            InkWell(
              onTap: (){
                dialog(context);
              },
              child: Center(
              child: Container(
              height: MediaQuery.of(context).size.height*.2,
                width: MediaQuery.of(context).size.width*1,
        child: _image != null?
        ClipRect(
              child: Image.file(
              _image!.absolute,
              width: 100,
              height: 100,
              fit: BoxFit.fill,

      ),
      ):
        Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 100,
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue,
              ),

        ),
        )

      ),
            ),
                SizedBox(height: 30,),
                Form(
                 child: Column(
                   children: [
                     TextFormField(
                       controller: titleController,
                       keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Enter post title',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),

                        ),
                     ),
                      SizedBox(height: 30,),
                     TextFormField(
                       controller: descriotionController,
                       keyboardType: TextInputType.text,
                       minLines: 6,
                       maxLines: 500,
                       decoration: InputDecoration(
                         labelText: 'Description',
                         hintText: 'Enter post description',
                         border: OutlineInputBorder(),
                         hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                         labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),

                       ),
                     ),
                   ],
                 ),
                ),

                SizedBox(height: 30,),

                 ElevatedButton(
                    onPressed: ()async{
                      setState((){
                        showSpinner = true;
                      });
                      try{
                        int date = DateTime.now().millisecondsSinceEpoch;

                        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('Posts/$date');
                        UploadTask uploadTask = ref.putFile(_image!.absolute) as UploadTask;
                        await Future.value(uploadTask);
                        var newUrl = await ref.getDownloadURL();

                        final User? user = _auth.currentUser;

                        postRef.child("Post List").child(date.toString()).set({
                          "pId": date.toString(),
                          "pTime": date.toString(),
                          "pTitle": titleController.text.toString(),
                          "pDescription": descriotionController.text.toString(),
                          "pImage": newUrl.toString(),
                          "UEmail": user!.email.toString(),
                          "uId": user.uid.toString(),


                        }).then((value){
                          toastMessage("Post Uploaded");
                          setState((){
                            showSpinner = false;
                          });

                        }).onError((error, stackTrace){
                          toastMessage(error.toString());
                          setState((){
                            showSpinner = false;
                          });

                        });

                      }catch(e){

                        setState((){
                          showSpinner = false;
                        });

                        toastMessage(e.toString());
                      }

                    },
                    child: Text('Upload Post'),
                  )
      ],
            ),
          ),

        ),

      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: "Image Uploaded",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
