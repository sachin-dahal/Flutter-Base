import 'package:flutter/material.dart';
import 'screens/loading_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFffffdd),
      ),
      title: 'Corona Tracking App',
      home: LoadingPage(),
    );
  }
}
