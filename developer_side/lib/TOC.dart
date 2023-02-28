import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TOC extends StatefulWidget {
  const TOC({super.key});

  @override
  State<TOC> createState() => _TOCState();
}

class _TOCState extends State<TOC> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Theory of Computation"),
        backgroundColor: Colors.black,
      ),

      /* body: SingleChildScrollView(

                child: Container(

                 child: Text("Programming… Competitive Programming… It teaches you how to think?. If you are a programmer, you might have understood the deep meaning of these lines quoted by Steve Jobs and you might have also experienced that even after shutting down your computer you keep on thinking about programming stuff or code you have written in your project. Once you enter in programming you just don’t learn how to code but you also learn the “art of thinking”, by breaking your code into smaller chunks and then using your logic-based creativity to solve a problem from different angles. Programming is fun, programming is an exercise for your brain, programming is a mental sport and when this sport is held on the internet involving sports programmer as a contestant, then it is called Competitive Programming.Programming is a challenging role and once you enter this field you will encounter new challenges and you may have to solve some problems which no one has solved before or their solution doesn’t exist anywhere. At that time, you are expected to come up with a solution in the least possible time using your problem-solving and logical ability. So the one and clear goal behind this competitive programming is “To prepare a programmer such that his/her logical ability increases and he/she is able to write code for the challenging situation.” Another reason is that a lot of big companies, like Google, Facebook. Microsoft, Amazon hires through competitive programming, so if you want to get into these companies, then you really need to get your hands dirty in competitive programming.",
                 style: TextStyle(
                  fontSize: 25.0
                 ),),
                   ),
              ),*/

      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://youtube.com/playlist?list=PL8zqenHlYxD2YUc6oou2YcOLuWuh63_5j',
        ),
      ),
    );

  }
}

