import 'dart:io';

import 'package:flutter/material.dart';

class Add_post extends StatefulWidget {
  const Add_post({Key? key}) : super(key: key);

  @override
  State<Add_post> createState() => _Add_postState();
}

class _Add_postState extends State<Add_post> {
  File? _image ;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriotionController = TextEditingController();

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

                    },
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: (){

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
    return Scaffold(

        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Upload Post'),
            centerTitle: true,

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
            fit: BoxFit.fitHeight,

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
                  onPressed: (){

                  },
                  child: Text('Upload Post'),
                )
    ],
          ),
        ),

      ),

    );
  }
}
