import 'package:flutter/material.dart';
import 'package:test_herd/test_screens/firstScreen.dart';

void main() {
  runApp(new MyFlutterApp(),);
}

class MyFlutterApp extends StatelessWidget {  // runApp(new MyFlutterApp(),);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,  // hide debug banner

        title: "My First App",
        home: Scaffold(
          appBar: new AppBar(
            title: Text("My App Bar"),
          ),
          body: MyFirstScreen()
        )
    );
  }
}
