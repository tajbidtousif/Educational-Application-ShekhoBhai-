import 'package:flutter/material.dart';

  class teacherdashboard extends StatefulWidget {
  const teacherdashboard({super.key});

  @override
  State<teacherdashboard> createState() => teacherdashboardState();
}

class teacherdashboardState extends State<teacherdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             
             backgroundColor: Colors.grey[350],
           
             body: ListView(
             
              children: [
                      
                      appbar(),
                      SizedBox(height: 25.0),

                     

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0,),
                            color: Colors.grey[200],
                          
                           ),
                           height: MediaQuery.of(context).size.height /1.762,
                           width: MediaQuery.of(context).size.width /1,
                           
                           child: GridView.count(crossAxisCount: 2,
                           crossAxisSpacing: 1,
                           mainAxisSpacing: 1,
                           
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           
                            children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0,),
                                        color: Colors.grey[200],
                          
                                        ),

                                        child: Column(children: [
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                  height: 140,
                                                  width: 140,
                                                decoration: BoxDecoration(
                                                            
                                                           borderRadius: BorderRadius.circular(15.0,),
                                                           image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/vectors/cute-smiling-teacher-or-tutor-avatar-internet-learning-online-distant-vector-id1223590000?k=20&m=1223590000&s=612x612&w=0&h=4m28LSnlGm1v9VxgY6bd9t5aNLPspGZWcjvBxLqKfc4=",), fit: BoxFit.fill,),
                                                         ),
                                            ),
                                          ),

                                          SizedBox(height: 2.0,),

                                          Text("Create Course"),
                                          
                                           ]
                                        ),
                                        
                                      ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0,),
                                        color: Colors.grey[200],
                          
                                        ),

                                        child: Column(children: [
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                  height: 140,
                                                  width: 140,
                                                decoration: BoxDecoration(
                                                            
                                                           borderRadius: BorderRadius.circular(15.0,),
                                                           image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/vectors/mid-age-teacher-giving-a-trigonometry-lecture-vector-id628333304?k=6&m=628333304&s=170667a&w=0&h=nRbF9tXpXVryOCPz_G4NmbEJMgfbvJAcamJSoVfaknE="), fit: BoxFit.fill,),
                                                           
                                                         ),
                                            ),
                                          ),

                                          SizedBox(height: 2.0,),

                                          Text("Live Session"),
                                          
                                           ]
                                        ),
                                        
                                      ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0,),
                                        color: Colors.grey[200],
                          
                                        ),

                                        child: Column(children: [
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                  height: 140,
                                                  width: 140,
                                                decoration: BoxDecoration(
                                                            
                                                           borderRadius: BorderRadius.circular(15.0,),
                                                           image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/vectors/woman-teacher-tutor-tutoring-kid-vector-id636071412?k=6&m=636071412&s=612x612&w=0&h=v6tgEu6FLHo-W0QpW-tibDcfdk6yPSrb_m3njLBPyKg="),fit: BoxFit.fill,),
                                                           
                                                         ),
                                            ),
                                          ),

                                          SizedBox(height: 2.0,),

                                          Text("Interactive Session"),
                                          
                                           ]
                                        ),
                                        
                                      ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0,),
                                        color: Colors.grey[200],
                          
                                        ),

                                        child: Column(children: [
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                  height: 140,
                                                  width: 140,
                                                decoration: BoxDecoration(
                                                            
                                                           borderRadius: BorderRadius.circular(15.0,),
                                                           image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/R.565cef2a572c5b32f2613493c7f25ca8?rik=oLmZYUpxIKGpGg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-1BlEFznxw3c%2fUxvPhfDKNPI%2fAAAAAAAADd8%2fC5iPLB6kdCg%2fs1600%2fcourseSelection-286x300.gif&ehk=Vo8m1Wv2XgTvKJsxGWtM0qZegV7CNJQnZhtTsIoEkBM%3d&risl=&pid=ImgRaw&r=0"),fit: BoxFit.fill,),
                                                          
                                                         ),
                                            ),
                                          ),

                                          SizedBox(height: 2.0,),

                                          Text("View Course"),
                                          
                                           ]
                                        ),
                                        
                                      ),
                                  ),
                                  
                                  
                                  
                                  
                                     
                                    /*image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/vectors/mid-age-teacher-giving-a-trigonometry-lecture-vector-id628333304?k=6&m=628333304&s=170667a&w=0&h=nRbF9tXpXVryOCPz_G4NmbEJMgfbvJAcamJSoVfaknE="), fit: BoxFit.fill,),*/
                                     /* image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/vectors/woman-teacher-tutor-tutoring-kid-vector-id636071412?k=6&m=636071412&s=612x612&w=0&h=v6tgEu6FLHo-W0QpW-tibDcfdk6yPSrb_m3njLBPyKg="),fit: BoxFit.fill,),*/
                                     /*image: DecorationImage(image: NetworkImage("https://th.bing.com/th/id/R.565cef2a572c5b32f2613493c7f25ca8?rik=oLmZYUpxIKGpGg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-1BlEFznxw3c%2fUxvPhfDKNPI%2fAAAAAAAADd8%2fC5iPLB6kdCg%2fs1600%2fcourseSelection-286x300.gif&ehk=Vo8m1Wv2XgTvKJsxGWtM0qZegV7CNJQnZhtTsIoEkBM%3d&risl=&pid=ImgRaw&r=0"),fit: BoxFit.fill,),*/
                                    ],

                           ),

                        ),
                      )
                      
                      
              ],
             ),
                
           );
}


    
    /*Appbar Constructor*/
    appbar()
    {
         return Container(

               padding:  EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
               ),
             
             child: Column(
                      children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Row(
                                     children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/modern-education-2/128/71-512.png"),
                                          ),

                                          SizedBox(width: 10.0,),
                                          Text("Hi, I am Jon", style: TextStyle(color: Colors.black),),

                                     ],  
                                ),

                                IconButton(onPressed:() {}, 
                                icon: Icon(Icons.notifications, 
                                color: Colors.white,)),
                               ],
                           
                           ), 
                         SizedBox(height: 30.0,),

                         /*searchbar */
                         TextField(
                               decoration: InputDecoration(
                                hintText: "Search",
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Icon(Icons.filter_list),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.transparent),
                                ),
                               

                                ),

                               ),

                       ]
                     ),
             


            );




    }


}





