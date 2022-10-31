import 'package:flutter/material.dart';
import 'logIn.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    final pages = [

      // ----------------------1st Container starts from here -------------------

      Container(
        color: Colors.white,




      ),

      // ----------------------1st Container ends here-------------------


      //-----------------------2nd cntainer start from here -------------------

      Container(
        color: Colors.tealAccent,
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage('assets/asAStudent.png'),
              height: height * 0.3,
            ),
            Column(
              children: [
                Text(
                  "Our Student Feature",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We create a bridge between learners and mentors",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),

      ),

      //-------------- 2nd container ends here ---------------------


      //-------------- 3rd container starts from here ---------------------
       Container(

        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage('assets/welcomeimage.jpg'),
              height: height * 0.3,
            ),
            Column(
              children: [
                Text(
                  "Welcome to ShekhoBha!",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We create a bridge between learners and mentors",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => lonIn()));
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          side: const BorderSide(color: Colors.black),
                          padding: const EdgeInsets.symmetric(vertical: 8)),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                       onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.blueAccent),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text("SIGNUP")),
                ),
              ],
            )
          ],
        ),
      ),

      //-------------- 3rd container ends here ---------------------

    ];

    return Scaffold(
      body: SafeArea(
        child: LiquidSwipe(
          pages: pages,
        ),
      ),
    );
  }
}
