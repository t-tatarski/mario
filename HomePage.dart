import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mario/Direction.dart';
import 'package:mario/MyMario.dart';
import 'ButtonCtrl.dart';

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState  extends State<HomePage>{

  static double mx=0;
  static double my=1;
  double time = 0 ;
  double height = 0;
  double initialHeight = my;
  Direction direction = Direction.L;

  void preJump(){
    setState(() {
      time=0;
      height=0;
      initialHeight = my;
    });
    debugPrint('prejump invoked');
  }

  void moveBack(){
     Timer.periodic(Duration(milliseconds: 50), (timer) {
       if(ButtonCtrl().userHoldBtn() == true){
         setState(() {
           direction=Direction.R;
           mx-=0.02;
         });
       }else{
         timer.cancel();
       }
     });


  }
  void moveForward(){
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if(ButtonCtrl().userHoldBtn() == true){
        setState(() {
          direction=Direction.L;
          mx+=0.02;
        });
      }else{
        timer.cancel();
      }
    });

  }

  void jump(){
    preJump();
    Timer.periodic(Duration(milliseconds: 50),(timer){
      time+= 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height >1){
        setState(() {
          my =1;
          timer.cancel();
        });
        debugPrint('time : ${time}');
        debugPrint('height: ${height}');
      }else{
        setState(() {
          my = initialHeight - height;
        });
      }
      if(height<-30.0){
        setState(() {
          height=30.0;
        });
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blue, Colors.greenAccent])),
             //color: Colors.blue,
           child: Container(
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.cyan, Color(0xFFBBBBFF)])),
               child: AnimatedContainer(
                 alignment: Alignment(mx,my),
                   child: MyMario(direction: direction),
               duration: Duration(milliseconds: 0),)),
           //decoration: Gradient(colors: LinearGradient(begin: Colors.blue, end: Colors.white70)),
          )),
          Expanded(
              flex: 1,
              child: Container(
             color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCtrl(child: Icon(Icons.arrow_back), function: moveBack,),
                    ButtonCtrl(child: Icon(Icons.arrow_upward),function: jump,),
                    ButtonCtrl(child: Icon(Icons.arrow_forward), function: moveForward,),
                  ],
                ),
          ))
        ],
      ),
    );
  }

}
