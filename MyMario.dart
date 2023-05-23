import 'package:flutter/material.dart';
import 'Direction.dart';

class MyMario extends StatelessWidget {
  const MyMario({Key? key, this.direction}) : super(key: key);

  final direction;

  @override
  Widget build(BuildContext context) {
    if(direction==Direction.L){
      return Container(
        width: 35,
        height: 35,
        child: Image.asset('assets/img.png'),
        // direction==Direction.L ? Image.asset(right) : Image.asset(left)

      );
    }else{
      return Container(
        width: 35,
        height: 35,
        child: Image.asset('assets/imgrr.png'),
      );
    }

  }
}
