import 'package:flutter/material.dart';
import 'package:tryanimation/main_screen.dart';

void main() => runApp(TryAnimation());

class TryAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Try',
      home: MainPage(),
    );
  }
}
