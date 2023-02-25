import 'package:flutter/material.dart';

class Webdevelopment extends StatefulWidget {
  const Webdevelopment({super.key});

  @override
  State<Webdevelopment> createState() => _WebdevelopmentState();
}

class _WebdevelopmentState extends State<Webdevelopment> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
              
              appBar: AppBar(
                centerTitle: true,
                title: Text("WEB DEVELOPMENT"),
                backgroundColor: Colors.black,
              ),
              
              
              
              body: SingleChildScrollView(
                
                child: Container(
                  
                 child: Text("Web development is the process of building websites and applications for the internet, or for a private network known as an intranet.Web development is not concerned with the design of a website; rather, it’s all about the coding and programming that powers the website s functionality.From the most simple, static web pages to social media platforms and apps, from e-commerce websites to content management systems (CMS) all the tools we use via the internet on a daily basis have been built by developers.In the world of web development, languages are the building blocks that programmers use to create websites, apps and software. There are all different types of languages, including programming languages, markup languages, style sheet languages, and database languages.Web developers also work with libraries and frameworks. Despite much confusion, they are not the same thing—although they are both there to make the developer’s job easier.Libraries and frameworks are essentially sets of prewritten code, but libraries are smaller and tend to be used for more specific use-cases. A library contains a collection of useful code, grouped together to be reused later. The purpose of a library is to enable developers to reach the same end goal while writing less code to get there.Let’s take the example of JavaScript, the language, and jQuery, a JavaScript library. Rather than writing, say, ten lines of code in JavaScript, the developer can take the condensed, prewritten version from the jQuery library—saving time and effort.",
                 style: TextStyle(
                  fontSize: 25.0
                 ),),               
                   ),
              ),


    );
  }
}