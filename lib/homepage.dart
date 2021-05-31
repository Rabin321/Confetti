import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ConfettiController controller;

  @override
  void initState() {
    controller = ConfettiController(duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirection: pi,
                gravity: 0.0,
                numberOfParticles: 900,
                emissionFrequency: 0.1,
                displayTarget: false,
                blastDirectionality: BlastDirectionality.explosive,
              ),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  controller.play();
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      
                      content: Container(
                        height: 60,
                        width: 60,
decoration: BoxDecoration(
  
  color: Colors.white,
  border: Border.all(width: 2, color: Colors.black) ,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      blurRadius: 10,
      color: Colors.blueGrey,
      offset: Offset(1, 10),
    )
  ]
),

                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("       Congratulation!\n    You won the lottery",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
                        ),

                      ),

                    );

                  });
                });
              },
              child: Text(
                "Press here",
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600,color: Colors.black),
              ),
            )
          ],
        )),
      ),
    );
  }
}
