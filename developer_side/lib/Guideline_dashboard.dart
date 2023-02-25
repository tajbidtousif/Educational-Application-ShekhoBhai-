import 'package:developer_side/AI.dart';
import 'package:developer_side/UI.dart';
import 'package:flutter/material.dart';
import 'Programming.dart';
import 'Webdevelopment.dart';
import 'UI.dart';
import 'Noc.dart';
import 'ML.dart';

class guideline extends StatefulWidget {
  const guideline({super.key});

  @override
  State<guideline> createState() => _guidelineState();
}

class _guidelineState extends State<guideline> {
  Card makeDashBoardItems(String title, String img, int index){
      return Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child: Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5),
               gradient: const LinearGradient(
                begin: FractionalOffset(0.0, 0.0),

                colors: [
                        Color(0xFF004880),
                        Color(0xFFFFFFFF),

                ]
               ),
               boxShadow: const[
                   BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                   )
                
               ],


           ),
           child: InkWell(
            onTap: (() {
              if(index==0)
              {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Programming()))) ;
              }
              if(index==1)
              {
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => Webdevelopment()))) ;

              }
              if(index==2)
              {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => UI()))) ;
              }
              if(index==3)
              {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => Noc()))) ;
              }
              if(index==4)
              {
                         Navigator.push(context, MaterialPageRoute(builder: ((context) =>ML()))) ;
              }
              if(index==5)
              {
                       
                       
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => AI()))) ;

                       
              }
             
             }
             
           ),

           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50,),
             Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
             )

            ],

           ),
            
           

        ),
        ),
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
             backgroundColor: const Color.fromARGB(255, 170, 193, 232),
             body: Column(children: [
                   const SizedBox(height: 100),
                   Padding(padding: const EdgeInsets.only(left: 16, right: 16),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                           Text("Computer Science GuideLine",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                           ),
                           ),
                           SizedBox(height: 4),
                           Text("Catagories: ", style: TextStyle(fontSize: 18,
                           fontWeight: FontWeight.bold),
                           )

                      ],
                     )

                    ],
                   ),
                   ),

                   const SizedBox(height: 20,),
                   Expanded(child: GridView.count(crossAxisCount: 2,
                    padding: const EdgeInsets.all(2),
                    children: [
                      makeDashBoardItems("Programming", "assetscp.PNG", 0),
                         makeDashBoardItems("Web Development", "assetscp.PNG", 1),
                            makeDashBoardItems("UI Design", "assetscp.PNG", 2),
                               makeDashBoardItems("Network Engineering", "assetscp.PNG", 3),
                                  makeDashBoardItems("Machine Learning", "assetscp.PNG", 4),
                                     makeDashBoardItems("Artificial Intelligence", "assetscp.PNG", 5),
                     
                    ],
                   ))
                  

             ]),



    );
  }
}