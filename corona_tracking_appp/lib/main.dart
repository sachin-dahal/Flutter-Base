import 'package:corona_tracking_appp/services/update_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/loading_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UpdateMethod(),
      child: MyApp(),
    ),
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
