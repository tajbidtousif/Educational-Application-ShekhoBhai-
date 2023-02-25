import 'package:flutter/material.dart';

class Noc extends StatefulWidget {
  const Noc({super.key});

  @override
  State<Noc> createState() => _NocState();
}

class _NocState extends State<Noc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              
              appBar: AppBar(
                centerTitle: true,
                title: Text("NETWORK ENGINEERING"),
                backgroundColor: Colors.black,
              ),
              
              
              
              body: SingleChildScrollView(
                
                child: Container(
                  
                 child: Text("A network engineer is someone who creates and monitors computer networks on behalf of individual clients and organizations. They ensure that devices have stable connections to the internet and that network data remains secure. If interested in pursuing a career that combines creativity with computer science, working as a network engineer may be a worthwhile role to consider. A network engineer designs, implements and maintains computer networks, which are systems that allow computers to communicate with each other and share data and resources. The work that network engineers do can help people and companies stay connected with the internet and communicate with others. Those in this role make sure networks are functional and explain how they work to colleagues, junior employees, supervisors and customers. They identify and solve network issues, perform routine maintenance and protect data from cyber attacks.Network engineers typically work for a single company and report to a chief information security officer or other supervisors. They may also collaborate with project managers and other network engineers to perform their job duties. While they usually spend their time in an office working with computer equipment, they sometimes travel to individual business locations to provide tech support services. Network engineers are in charge of the operation, repair and improvement of computer networks. Their job duties may overlap with those of similar roles, such as network administrators or security system engineers.Develop and install network infrastructure, configurations and equipment such as routers and switches.Implement data security systems such as firewalls, virus protection software and data backups.Monitor networks and troubleshoot issues or outages.Perform routine network maintenance, including installing upgrades and service packs.Network engineers can benefit from having a bachelor's degree in computer science, computer systems engineering, electrical engineering, information technology, network security management or a related field. If they continue their education to get a master's degree in the field, it may increase their job prospects and earning potential. Those in this role often practice continuing education by keeping up to date with industry advancements and trends and completing professional development courses.",
                 style: TextStyle(
                  fontSize: 25.0
                 ),),               
                   ),
              ),


    );
  }
}