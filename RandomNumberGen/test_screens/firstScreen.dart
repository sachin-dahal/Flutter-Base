import 'dart:math';

import 'package:flutter/material.dart';

class MyFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          generateLuckyNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 25.0, color: Colors.amberAccent),
        ),
      ),
    );
  }


  String generateLuckyNumber(){
    var random = Random();
    int luckyNumber = random.nextInt(10);

    return "Your Lucky Number is $luckyNumber";
  }

}
