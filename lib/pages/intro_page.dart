import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248,	244, 240),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0, right: 80, top: 300, bottom: 100),
            child: Image.asset("lib/images/Logo1.png"),
          ),
          //const Padding(
            //padding:  EdgeInsets.all(24.0),
            //child: Text(
              //"We deliver groceries at your doorstep",
              //textAlign: TextAlign.center,
              //style: TextStyle(
                //fontSize: 20,
                //fontWeight: FontWeight.bold,
              //)
            //),
          //),

          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context){
                  return HomePage();
                },
            )),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(49, 68, 1, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
            ),
           ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
