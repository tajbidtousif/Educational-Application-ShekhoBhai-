import 'package:developer_side/Oop.dart';
import 'package:developer_side/TOC.dart';
import 'package:flutter/material.dart';

import 'ComputerGraphics.dart';
import 'WebDevelopmentPlaylist.dart';
import 'Webdevelopment.dart';

class FindCourse extends StatefulWidget {
  const FindCourse({Key? key}) : super(key: key);

  @override
  State<FindCourse> createState() => _FindCourseState();
}

class _FindCourseState extends State<FindCourse> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle:true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text("Find Course",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            ),

          ),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebDevelopmentPlaylist()));
              },
              title: Text("Web Development"),
              subtitle: Text("With Anisul Islam"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://stiffentechnologies.com/wp-content/uploads/2021/11/Web-Development.jpg"),
              ),
              trailing: Icon(Icons.transit_enterexit_outlined),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ComputerGraphics()));
              },
              title: Text("Computer Graphics"),
              subtitle: Text("With Ebrahim Hossain"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://media.sciencephoto.com/image/t4780203/400wm/T4780203-Computer_graphics_image_of_4_wire-drawn_spheres.jpg"),
              ),
              trailing: Icon(Icons.transit_enterexit_outlined),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TOC()));
              },
              title: Text("Theory of Computation"),
              subtitle: Text("With Adil Ahmed Chowdhury"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://www.analyticssteps.com/backend/media/thumbnail/7112756/6398655_1626243000_Top%20Applications%20of%20Theory%20of%20ComputationArtboard%201.jpg"),
              ),
              trailing: Icon(Icons.transit_enterexit_outlined),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Oop()));
              },
              title: Text("Object Oriented Programming"),
              subtitle: Text("With Adil Ahmed Chowdhury"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://www.developer.com/wp-content/uploads/2021/09/Java-tutorials-300x200.jpg"),
              ),
              trailing: Icon(Icons.transit_enterexit_outlined),
            ),
          ],
        ),
      )
    );
  }
}
