import 'package:flutter/material.dart';

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
              
              appBar: AppBar(
                centerTitle: true,
                title: Text("ARTIFICAL INTELLIGENCE"),
                backgroundColor: Colors.black,
              ),
              
              
              
              body: SingleChildScrollView(
                
                child: Container(
                  
                 child: Text("Artificial intelligence (AI) is a field of computer science and engineering focused on the creation of intelligent agents, which are systems that can reason, learn, and act autonomously. AI has been used in a variety of domains, including finance, healthcare, manufacturing, and education. AI is particularly well suited for computer science students because of its focus on algorithms and programming. "
                     "AI requires students to have strong analytical and problem-solving skills, as well as the ability to think abstractly.There are a total of four approaches of AI and that are as follows: Acting humanly (The Turing Test approach): This approach was designed by Alan Turing. The ideology behind this approach is that a computer passes the test if a human interrogator, after asking some written questions, cannot identify whether the written responses come from a human or from a computer.Thinking humanly (The cognitive modeling approach): The idea behind this approach is to determine whether the computer thinks like a human. Thinking rationally (The “laws of thought” approach):  The idea behind this approach is to determine whether the computer thinks rationally i.e. with logical reasoning. Acting rationally (The rational agent approach): The idea behind this approach is to determine whether the computer acts rationally i.e. with logical reasoning. ",
                 style: TextStyle(
                  fontSize: 25.0
                 ),),               
                   ),
              ),


    );
}
}