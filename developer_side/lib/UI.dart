import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
              
              appBar: AppBar(
                centerTitle: true,
                title: Text("UI DESIGN"),
                backgroundColor: Colors.black,
              ),
              
              
              
              body: SingleChildScrollView(
                
                child: Container(
                  
                 child: Text("A user interface is the point of interaction between humans and computers. User interface design is the process of designing how these interfaces look and behave. Imagine you’re using an app on your smartphone to book flights. The screens you navigate, the buttons you tap and the forms you fill out are all part of the user interface.ust like the interior designers in our hotel analogy, UI designers come in at the later stages of the product design process. Some key steps in the UI design process include.Understanding the context.You can’t design the user interface for a product without knowing who will be using it and what they’ll be using it for. The UI designer will start by getting familiar with the project brief in order to understand the target audience they’re designing for and the purpose of the product. Conducting competitor analysis.UI designers might conduct competitor analysis to see what other brands operating in the same space are doing. This helps you to understand what your users expect when interacting with certain products, allowing you to design interfaces that feel familiar and are therefore easier to use. Designing screens and UI elements Of course, a substantial part of the UI design process focuses on design. UI designers will design all the individual screens that make up the user journey and the different elements that feature on these screens. This includes designing icons and buttons, selecting or creating imagery, making decisions about colours and typography and designing any animations and interactions. Creating wireframes and prototypes.Throughout the UI design process, UI designers will create wireframes and prototypes. In the early stages, low-fidelity wireframes can be used to map out the position of different elements on the screen. As initial ideas progress to concrete design decisions, high-fidelity, clickable prototypes are used to model the final look and feel of the product. With high-fidelity prototypes, UI designers can communicate not only what the product UI should look like but also how it should behave when the user interacts with it. Handing off to developers.Once the product UI has been finalised, it’s over to the developers to turn the UI designer’s prototypes into a real, working product. It’s important to be aware that moving from high-fidelity prototypes to development might not always be straightforward as developers and other stakeholders may have feedback, requiring you to iterate on your designs. ",
                 style: TextStyle(
                  fontSize: 25.0
                 ),),               
                   ),
              ),


    );
  }
}