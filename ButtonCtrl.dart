import 'package:flutter/material.dart';

class ButtonCtrl extends StatelessWidget{

  final child;
  final function;
  static bool holdingBtn = false;


  const ButtonCtrl({this.child, this.function});

  bool userHoldBtn(){
    return holdingBtn;
  }

  @override
  Widget build(BuildContext context) {
   return  GestureDetector(
     onTapDown: (details){
       holdingBtn=true;
       function();
     },
     onTapUp: (details){
       holdingBtn=false;
     },
     child:
     ClipRRect(
       borderRadius: BorderRadius.circular(8),
       child: Container(
         padding: EdgeInsets.all(12),
         color: Colors.deepOrangeAccent,
         child: child,
       ),
     ),
   );
  }

}